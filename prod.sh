#!/usr/bin/env bash
echo Starting AI Shack prod server
source env_prod/bin/activate
SHA1=`git rev-parse HEAD`
export SHA1
echo $SHA1
source env_prod/bin/activate
exec env SHA1=$SHA1 uwsgi --env SHA1=$SHA1 --ini $PWD/aishack_uwsgi.ini
