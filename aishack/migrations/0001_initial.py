# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Tutorial'
        db.create_table(u'aishack_tutorial', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(unique=True, max_length=128)),
            ('content', self.gf('django.db.models.fields.TextField')()),
            ('date', self.gf('django.db.models.fields.DateField')()),
            ('category', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['aishack.Category'])),
            ('slug', self.gf('django.db.models.fields.CharField')(unique=True, max_length=128)),
            ('post_image', self.gf('django.db.models.fields.URLField')(max_length=256)),
            ('excerpt', self.gf('django.db.models.fields.CharField')(max_length=512)),
        ))
        db.send_create_signal(u'aishack', ['Tutorial'])

        # Adding model 'Category'
        db.create_table(u'aishack_category', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(unique=True, max_length=256)),
            ('desc', self.gf('django.db.models.fields.CharField')(max_length=1024)),
        ))
        db.send_create_signal(u'aishack', ['Category'])

        # Adding model 'Track'
        db.create_table(u'aishack_track', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(unique=True, max_length=256)),
        ))
        db.send_create_signal(u'aishack', ['Track'])

        # Adding model 'TrackTutorials'
        db.create_table(u'aishack_tracktutorials', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('track', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['aishack.Track'])),
            ('tutorial', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['aishack.Tutorial'])),
        ))
        db.send_create_signal(u'aishack', ['TrackTutorials'])

        # Adding model 'Quiz'
        db.create_table(u'aishack_quiz', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=128)),
        ))
        db.send_create_signal(u'aishack', ['Quiz'])


    def backwards(self, orm):
        # Deleting model 'Tutorial'
        db.delete_table(u'aishack_tutorial')

        # Deleting model 'Category'
        db.delete_table(u'aishack_category')

        # Deleting model 'Track'
        db.delete_table(u'aishack_track')

        # Deleting model 'TrackTutorials'
        db.delete_table(u'aishack_tracktutorials')

        # Deleting model 'Quiz'
        db.delete_table(u'aishack_quiz')


    models = {
        u'aishack.category': {
            'Meta': {'object_name': 'Category'},
            'desc': ('django.db.models.fields.CharField', [], {'max_length': '1024'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '256'})
        },
        u'aishack.quiz': {
            'Meta': {'object_name': 'Quiz'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '128'})
        },
        u'aishack.track': {
            'Meta': {'object_name': 'Track'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '256'})
        },
        u'aishack.tracktutorials': {
            'Meta': {'object_name': 'TrackTutorials'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'track': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['aishack.Track']"}),
            'tutorial': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['aishack.Tutorial']"})
        },
        u'aishack.tutorial': {
            'Meta': {'object_name': 'Tutorial'},
            'category': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['aishack.Category']"}),
            'content': ('django.db.models.fields.TextField', [], {}),
            'date': ('django.db.models.fields.DateField', [], {}),
            'excerpt': ('django.db.models.fields.CharField', [], {'max_length': '512'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'post_image': ('django.db.models.fields.URLField', [], {'max_length': '256'}),
            'slug': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '128'}),
            'title': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '128'})
        }
    }

    complete_apps = ['aishack']