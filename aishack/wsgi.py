"""
WSGI config for aishack project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/howto/deployment/wsgi/
"""

import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "aishack.settings")

print('Starting with environment variables:')
for var, value in os.environ.items():
    print('%s: %s' % (var, value))

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
