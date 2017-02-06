from django.db import models
from django.contrib.auth.models import User

from haystack import indexes

from aishack.models import Tutorial, Category, TutorialSeries

"""
Search indexes for elasticsearch / haystack
"""

class TutorialIndex(indexes.SearchIndex, indexes.Indexable):
    text = indexes.CharField(document=True, use_template=True)
    author = indexes.CharField(model_attr='author')

    def get_model(self):
        return Tutorial

class TutorialSeriesIndex(indexes.SearchIndex, indexes.Indexable):
    text = indexes.CharField(document=True, use_template=False, model_attr='name')

    def get_model(self):
        return TutorialSeries

class CategoryIndex(indexes.SearchIndex, indexes.Indexable):
    text = indexes.CharField(document=True, use_template=True)

    def get_model(self):
        return Category

