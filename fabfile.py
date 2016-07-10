#!/usr/bin/env python

from fabric.api import task, run, put

@task()
def deploy():
    run("cd /work/aishack/ && git pull")
    put("./aishack/setup.py", "/work/aishack/")
    run("cd /work/aishack/ && python setup.py")
    run("cd /work/aishack/ && docker build -t aishack .")
