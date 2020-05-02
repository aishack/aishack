#!/usr/bin/env python

# This tool ingests a given markdown file into the tutorial database

# standard imports
import sys, os
import random
import markdown, re
from datetime import datetime
from bs4 import BeautifulSoup

# Django specific imports
from django.core.management.base import BaseCommand, CommandError
from django.contrib.auth.models import User
import nltk
import numpy as np
from sklearn.feature_extraction.text import TfidfVectorizer
from aishack import settings
from aishack.models import Tutorial, Category
from haystack.query import SearchQuerySet

class Command(BaseCommand):
    help = "Ingest a tutorial markdown file into the database"
    args = "<md>"

    def _precompute_nltk_features(self, tutorials):
        print('Precomputing features.')
        nltk.download('punkt')
        stemmer = nltk.stem.porter.PorterStemmer()
        remove_punctuation_map = dict((ord(char), None) for char in "!\"#$%&'()*+, -./:;<=>?@[\]^_`{|}~")
        
        def stem_tokens(tokens):
            return [stemmer.stem(item) for item in tokens]

        def normalize(text):
            return stem_tokens(nltk.word_tokenize(text.lower().translate(remove_punctuation_map)))

        def extract_text(html):
            soup = BeautifulSoup(html, 'html.parser')
            code = soup.findAll('div', {'class': 'codehilite'})
            [x.extract() for x in soup.findAll('div', {'class': 'codehilite'})]
            [x.extract() for x in soup.findAll('img',)]
            word_list = soup.findAll(text=True)
            return  ''.join(word_list)

        vectorizer = TfidfVectorizer(tokenizer=normalize, stop_words='english')
        output = vectorizer.fit_transform([extract_text(x.content) for x in tutorials])
        output = output * output.T
        output = np.asarray(output.todense())
        output = output - np.eye(output.shape[0])
        return output

    def _compute_nltk_similarity(self, cached_computation, tutorials, idx):
        tutorial = tutorials[idx]
        top_n = list(reversed(cached_computation[idx, :].argsort().tolist()))
        if top_n[0] == idx:
            top_n.pop(0)

        related_list = []
        for n in top_n:
            if cached_computation[idx, n] > 0:
                to_add = tutorials[n]
                if tutorials[n].series:
                    to_add = tutorials[n].series.tutorials.first()
                if to_add not in related_list:
                    related_list.append(to_add)
            else:
                break

            if len(related_list) >= 20:
                break
        return related_list

    def _compute_es_similarity(self, tutorial):
        sqs = SearchQuerySet()
        related_tuts = sqs.more_like_this(tutorial).all()
        return [x.object for x in related_tuts.all() if type(x.object) == Tutorial]

    def handle(self, *args, **options):
        if len(args) != 0:
            raise CommandError("No parameters are required for this command")

        tutorials = Tutorial.objects.all()
        cached_computation = self._precompute_nltk_features(tutorials)
        for idx, tutorial in enumerate(tutorials):
            print('Processing %s' % tutorial.title)
            try:
                # Use elastic search's similarity score.
                related_tutorials = self._compute_es_similarity(tutorial)
            except:
                print('Fetching related tutorials from elastic search failed.')
                related_tutorials = []

            # If there are not enough related articles, try using NLTK.
            if len(related_tutorials) < 4:
                related_tutorials += self._compute_nltk_similarity(cached_computation, tutorials, idx)

            # If the number of related tutorials is still less than 4
            # (required by the theme) add random tutorials
            while len(related_tutorials) < 4:
                related_tutorials.append(random.choise(tutorial))

            tutorial.related.clear()
            for related in related_tutorials:
                assert related is not None
                print('    related: %s' % related.title)
                tutorial.related.add(related)
            tutorial.save()
        print('Done')

