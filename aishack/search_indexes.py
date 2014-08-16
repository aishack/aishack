from django.db import models
from django.contrib.auth.models import User

from haystack import indexes

from aishack.models import Tutorial

"""
Search indexes for elasticsearch / haystack
"""

class TutorialIndex(indexes.SearchIndex, indexes.Indexable):
    text = indexes.CharField(document=True, use_template=True)
    author = indexes.CharField(model_attr='author')

    def get_model(self):
        return Tutorial
