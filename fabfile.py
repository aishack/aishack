#!/usr/bin/env python

from fabric.api import task, run, put
from fabric.operations import local

@task()
def deploy():
    run("cd /work/aishack/ && git pull")
    put("./aishack/setup.py", "/work/aishack/")
    run("cd /work/aishack/ && python setup.py")
    put("./nginx.conf", "/work/aishack/")
    put("./varnish.vcl", "/work/aishack/")
    run("cd /work/aishack/ && docker build -t aishack .")

@task()
def restart():
    output = run("docker ps | grep 8000 | awk '{print$1}'")
    run("docker stop %s" % output)
