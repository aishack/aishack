#!/usr/bin/env python

# This tool ingests a given markdown file into the tutorial database

# standard imports
import sys, os
import markdown, re
from datetime import datetime
from bs4 import BeautifulSoup

# Django specific imports
from django.core.management.base import BaseCommand, CommandError
from django.contrib.auth.models import User
import nltk
import numpy as np
from sklearn.feature_extraction.text import TfidfVectorizer
from aishack.models import Tutorial, Category

class Command(BaseCommand):
    help = "Ingest a tutorial markdown file into the database"
    args = "<md>"

    def handle(self, *args, **options):
        if len(args) != 0:
            raise CommandError("No parameters are required for this command")

        tutorials = Tutorial.objects.all()

        print('Precomputing features.')
        nltk.download('punkt')
        stemmer = nltk.stem.porter.PorterStemmer()
        remove_punctuation_map = dict((ord(char), None) for char in "!\"#$%&'()*+, -./:;<=>?@[\]^_`{|}~")
        
        def stem_tokens(tokens):
            return [stemmer.stem(item) for item in tokens]

        def normalize(text):
            return stem_tokens(nltk.word_tokenize(text.lower().translate(remove_punctuation_map)))

        def extract_text(html):
            soup = BeautifulSoup(html)
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


        # loop over each tutorial
        for idx, tutorial in enumerate(tutorials):
            print('Working on: %s' % tutorial.title)
            top_n = list(reversed(output[idx, :].argsort().tolist()))
            if top_n[0] == idx:
                top_n.pop(0)

            tutorial.related.clear()
            for n in top_n:
                if output[idx, n] > 0:
                    to_add = tutorials[n]
                    if tutorials[n].series:
                        to_add = tutorials[n].series.tutorials.first()
                    if to_add not in tutorial.related.all():
                        print('    related: %s' % to_add.title)
                        tutorial.related.add(to_add)
                    tutorial.save()
                else:
                    break

                if tutorial.related.count() >= 10:
                    break
        print('Done.')
