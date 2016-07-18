# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('aishack', '0003_category_order'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tutorial',
            name='title',
            field=models.CharField(max_length=128),
        ),
    ]
