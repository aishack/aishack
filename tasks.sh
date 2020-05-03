#!/usr/bin/env bash
echo Starting AI Shack background tasks worker queue
source env_prod/bin/activate
source env_prod/bin/activate
exec celery worker -A scheduler --loglevel=info
