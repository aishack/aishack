#!/usr/bin/env python3
# Schedules an update in the task queue to reparse content and add it to the search index.

from scheduler import celery
from django.core.management.base import BaseCommand, CommandError

class Command(BaseCommand):
    help = "Schedule an update of contents."

    def handle(self, *args, **options):
        celery.refresh_contents.delay()
        print('Content refresh scheduled.')
