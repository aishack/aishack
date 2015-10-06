# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='AishackUser',
            fields=[
                ('user', models.OneToOneField(primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
                ('short_bio', models.CharField(max_length=256, blank=True)),
                ('bio', models.TextField(max_length=2048, blank=True)),
                ('website', models.URLField(blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(unique=True, max_length=256)),
                ('desc', models.CharField(max_length=1024, blank=True)),
                ('slug', models.SlugField()),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Quiz',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=128)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Track',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(unique=True, max_length=256)),
                ('thumbnail', models.CharField(max_length=255, blank=True)),
                ('slug', models.CharField(unique=True, max_length=128)),
                ('excerpt', models.CharField(max_length=255)),
                ('description', models.CharField(max_length=1024)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='TrackTutorials',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('order', models.IntegerField(default=0)),
                ('track', models.ForeignKey(to='aishack.Track')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Tutorial',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(unique=True, max_length=128)),
                ('content', models.TextField()),
                ('content_md', models.TextField()),
                ('date', models.DateField()),
                ('slug', models.CharField(unique=True, max_length=128)),
                ('post_image', models.ImageField(max_length=256, upload_to=b'/static/img/tut/')),
                ('post_thumb', models.ImageField(max_length=256, null=True, upload_to=b'/static/thumb/')),
                ('excerpt', models.CharField(max_length=512, blank=True)),
                ('featured', models.BooleanField(default=False)),
                ('read_count', models.BigIntegerField(default=0)),
                ('author', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
                ('category', models.ForeignKey(to='aishack.Category')),
                ('related', models.ManyToManyField(related_name='related_rel_+', to='aishack.Tutorial', blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='TutorialRead',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date', models.DateField(auto_now_add=True)),
                ('tutorial', models.ForeignKey(to='aishack.Tutorial')),
                ('user', models.ForeignKey(to='aishack.AishackUser')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='TutorialSeries',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=b'', max_length=256, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='TutorialSeriesOrder',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('order', models.IntegerField(default=0)),
                ('series', models.ForeignKey(to='aishack.TutorialSeries')),
                ('tutorial', models.ForeignKey(to='aishack.Tutorial')),
            ],
            options={
                'ordering': ('order',),
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='UserTrack',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('signup_date', models.DateField(auto_now_add=True)),
                ('track', models.ForeignKey(to='aishack.Track')),
                ('user', models.ForeignKey(to='aishack.AishackUser')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='tutorialseries',
            name='tutorials',
            field=models.ManyToManyField(to='aishack.Tutorial', through='aishack.TutorialSeriesOrder'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='tutorial',
            name='series',
            field=models.ForeignKey(default=None, blank=True, to='aishack.TutorialSeries', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='tracktutorials',
            name='tutorial',
            field=models.ForeignKey(to='aishack.Tutorial'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='track',
            name='tutorials',
            field=models.ManyToManyField(to='aishack.Tutorial', through='aishack.TrackTutorials'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='aishackuser',
            name='tracks_following',
            field=models.ManyToManyField(to='aishack.Track', through='aishack.UserTrack'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='aishackuser',
            name='tutorials_read',
            field=models.ManyToManyField(to='aishack.Tutorial', through='aishack.TutorialRead'),
            preserve_default=True,
        ),
    ]
