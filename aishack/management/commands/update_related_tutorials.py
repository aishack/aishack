#!/usr/bin/env python

# This tool ingests a given markdown file into the tutorial database

# standard imports
import sys, os
import markdown, re
from datetime import datetime

# Django specific imports
from django.core.management.base import BaseCommand, CommandError
from django.contrib.auth.models import User

from haystack.query import SearchQuerySet

from aishack.models import Tutorial, Category

class Command(BaseCommand):
    help = "Ingest a tutorial markdown file into the database"
    args = "<md>"

    def handle(self, *args, **options):
        if len(args) != 0:
            raise CommandError("No parameters are required for this command")

        tutorials = Tutorial.objects.all()
        sqs = SearchQuerySet()

        # loop over each tutorial
        for tutorial in tutorials:
            print 'Processing %s' % tutorial.title
            related_tuts = sqs.more_like_this(tutorial).all()
            num_related = related_tuts.count()
            print '    %s related tutorials' % num_related

            index = 0
            for rel in [x for x in related_tuts.all()]:
                if index > 20:
                    # Only store the top 20 
                    break

                if not rel or not rel.object:
                    import pdb; pdb.set_trace()
                    break

                tutorial.related.add(rel.object)
                tutorial.save()

                index = index + 1
