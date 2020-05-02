#!/usr/bin/env bash

python3 manage.py migrate --run-syncdb
python3 manage.py ingest_category $PWD/categories/*
python3 manage.py ingest_user $PWD/writers/*
python3 manage.py ingest_track $PWD/tracks/*
python3 manage.py ingest_tutorial $PWD/tutorials/*.md
python3 manage.py ingest_tutorial $PWD/tutorials/software/*.md
python3 manage.py rebuild_index --noinput
python3 manage.py update_related_tutorials
python3 manage.py update_index
