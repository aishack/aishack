#!/usr/bin/env python

import flask
from flask import Flask, request
import os
import simplejson
from hashlib import sha1
from ipaddress import ip_address, ip_network
import requests
from subprocess import Popen, PIPE
from os import access, X_OK, remove, fdopen
import tempfile
import logging


app = Flask(__name__)

@app.route("/webhook/", methods=['POST', 'GET'])
def webhook():
    if request.method == 'GET':
        return '<h1>O hai!</h1>'

    if request.method != 'POST':
        flask.abort(501)
        return

    # Load config
    path = os.getcwd()
    with open(os.path.join(path, 'hook_config.json')) as cfg:
        config = simplejson.loads(cfg.read())

    hooks = config.get('hooks_path', os.path.join(path, 'hooks'))

    # Allow Github IPs only
    if config.get('github_ips_only', True):
        src_ip = ip_address(
            u'{}'.format(request.access_route[0])  # Fix stupid ipaddress issue
        )
        whitelist = requests.get('https://api.github.com/meta').json()['hooks']

        for valid_ip in whitelist:
            if src_ip in ip_network(valid_ip):
                break
        else:
            print('IP {} not allowed'.format(
                src_ip
            ))
            flask.abort(403)

    # Enforce secret
    secret = config.get('enforce_secret', '')
    if secret:
        # Only SHA1 is supported
        header_signature = request.headers.get('X-Hub-Signature')
        if header_signature is None:
            flask.abort(403)

        sha_name, signature = header_signature.split('=')
        if sha_name != 'sha1':
            flask.abort(501)

        # HMAC requires the key to be bytes, but data is string
        mac = hmac.new(str(secret), msg=request.data, digestmod='sha1')

        # Python prior to 2.7.7 does not have hmac.compare_digest
        if hexversion >= 0x020707F0:
            if not hmac.compare_digest(str(mac.hexdigest()), str(signature)):
                flask.abort(403)
        else:
            # What compare_digest provides is protection against timing
            # attacks; we can live without this protection for a web-based
            # application
            if not str(mac.hexdigest()) == str(signature):
                flask.abort(403)

    # Implement ping
    event = request.headers.get('X-GitHub-Event', 'ping')
    if event == 'ping':
        return simplejson.dumps({'msg': 'pong'})

    # Gather data
    try:
        payload = request.get_json()
    except Exception:
        print('Request parsing failed')
        flask.abort(400)

    # Determining the branch is tricky, as it only appears for certain event
    # types an at different levels
    branch = None
    try:
        # Case 1: a ref_type indicates the type of ref.
        # This true for create and delete events.
        if 'ref_type' in payload:
            if payload['ref_type'] == 'branch':
                branch = payload['ref']

        # Case 2: a pull_request object is involved. This is pull_request and
        # pull_request_review_comment events.
        elif 'pull_request' in payload:
            # This is the TARGET branch for the pull-request, not the source
            # branch
            branch = payload['pull_request']['base']['ref']

        elif event in ['push']:
            # Push events provide a full Git ref in 'ref' and not a 'ref_type'.
            branch = payload['ref'].split('/', 2)[2]

    except KeyError:
        # If the payload structure isn't what we expect, we'll live without
        # the branch name
        pass

    # All current events have a repository, but some legacy events do not,
    # so let's be safe
    name = payload['repository']['name'] if 'repository' in payload else None

    meta = {
        'name': name,
        'branch': branch,
        'event': event
    }
    print('Metadata:\n{}'.format(simplejson.dumps(meta)))

    # Skip push-delete
    if event == 'push' and payload['deleted']:
        print('Skipping push-delete event for {}'.format(simplejson.dumps(meta)))
        return simplejson.dumps({'status': 'skipped'})

    # Possible hooks
    scripts = []
    if branch and name:
        scripts.append(os.path.join(hooks, '{event}-{name}-{branch}'.format(**meta)))
    if name:
        scripts.append(os.path.join(hooks, '{event}-{name}'.format(**meta)))
    scripts.append(os.path.join(hooks, '{event}'.format(**meta)))
    scripts.append(os.path.join(hooks, 'all'))

    # Check permissions
    scripts = [s for s in scripts if os.path.isfile(s) and os.access(s, X_OK)]
    if not scripts:
        return simplejson.dumps({'status': 'nop'})

    # Save payload to temporal file
    osfd, tmpfile = tempfile.mkstemp()
    with fdopen(osfd, 'w') as pf:
        pf.write(simplejson.dumps(payload))

    # Run scripts
    ran = {}
    for s in scripts:
        proc = Popen(
            [s, tmpfile, event],
            stdout=PIPE, stderr=PIPE
        )
        stdout, stderr = proc.communicate()
        ran[os.path.basename(s)] = {
            'returncode': proc.returncode,
            'stdout': stdout.decode('utf-8'),
            'stderr': stderr.decode('utf-8'),
        }
        # Log errors if a hook failed
        if proc.returncode != 0:
            logging.error('{} : {} \n{}'.format(
                s, proc.returncode, stderr
            ))

    # Remove temporal file
    remove(tmpfile)
    info = config.get('return_scripts_info', False)
    if not info:
        return simplejson.dumps({'status': 'done'})

    output = simplejson.dumps(ran, sort_keys=True, indent=4)
    logging.info(output)
    return output

if __name__ == "__main__":
    app.run(host='localhost', port='8086', threaded=True, debug=True)
