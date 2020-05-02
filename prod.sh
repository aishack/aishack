#!/usr/bin/env bash
echo Starting AI Shack prod server
source env_prod/bin/activate
SHA1=`git rev-parse HEAD`
export SHA1
source env_prod/bin/activate
uwsgi --ini $PWD/aishack_uwsgi.ini
