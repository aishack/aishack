#!/usr/bin/env python3
import os
from celery import Celery
from django.core.management import call_command


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'aishack.settings')
app = Celery('scheduler', broker='redis://127.0.0.1:6379')

@app.task
def debug_task():
    print('Hello world!')

@app.task
def refresh_contents():
    call_command('migrate', '--run-syncdb')

    command_mapping = {
        'writers': 'ingest_user',
        'categories': 'ingest_category',
        'tracks': 'ingest_track',
        'tutorials': 'ingest_tutorial',
    }

    for dirname, cmd in command_mapping.items():
        listing = _list_dir(dirname)
        call_command(cmd, *listing)

    # Index these ingestions.
    call_command('rebuild_index', '--noinput')

    call_command('update_related_tutorials')
    call_command('update_index')

def _list_dir(dirname):
    sub = os.listdir(dirname)
    sub = [os.path.join(os.getcwd(), dirname, x) for x in sub if x.endswith('.md')]
    return sub

#python3 manage.py migrate --run-syncdb
#python3 manage.py ingest_category $PWD/categories/*
#python3 manage.py ingest_user $PWD/writers/*
#python3 manage.py ingest_track $PWD/tracks/*
#python3 manage.py ingest_tutorial $PWD/tutorials/*.md
#python3 manage.py ingest_tutorial $PWD/tutorials/software/*.md
#python3 manage.py rebuild_index --noinput
#python3 manage.py update_related_tutorials
#python3 manage.py update_index
    

if __name__ == '__main__':
    app.start()

