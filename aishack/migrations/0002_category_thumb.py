# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('aishack', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='thumb',
            field=models.CharField(max_length=1024, blank=True),
        ),
    ]
