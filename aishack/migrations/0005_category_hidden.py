# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('aishack', '0004_auto_20160718_0500'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='hidden',
            field=models.BooleanField(default=False),
        ),
    ]
