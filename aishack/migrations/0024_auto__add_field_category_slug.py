# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'Category.slug'
        db.add_column(u'aishack_category', 'slug',
                      self.gf('django.db.models.fields.SlugField')(default='2014-08-29 22:07:16.806948+00:00', max_length=50),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting field 'Category.slug'
        db.delete_column(u'aishack_category', 'slug')


    models = {
        u'aishack.aishackuser': {
            'Meta': {'object_name': 'AishackUser'},
            'bio': ('django.db.models.fields.TextField', [], {'max_length': '2048', 'blank': 'True'}),
            'short_bio': ('django.db.models.fields.CharField', [], {'max_length': '256', 'blank': 'True'}),
            'tracks_following': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['aishack.Track']", 'through': u"orm['aishack.UserTrack']", 'symmetrical': 'False'}),
            'tutorials_read': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['aishack.Tutorial']", 'through': u"orm['aishack.TutorialRead']", 'symmetrical': 'False'}),
            'user': ('django.db.models.fields.related.OneToOneField', [], {'to': u"orm['auth.User']", 'unique': 'True', 'primary_key': 'True'}),
            'website': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'})
        },
        u'aishack.category': {
            'Meta': {'object_name': 'Category'},
            'desc': ('django.db.models.fields.CharField', [], {'max_length': '1024', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '50'}),
            'title': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '256'})
        },
        u'aishack.quiz': {
            'Meta': {'object_name': 'Quiz'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '128'})
        },
        u'aishack.track': {
            'Meta': {'object_name': 'Track'},
            'description': ('django.db.models.fields.CharField', [], {'max_length': '1024'}),
            'excerpt': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'slug': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '128'}),
            'thumbnail': ('django.db.models.fields.CharField', [], {'max_length': '255', 'blank': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '256'}),
            'tutorials': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['aishack.Tutorial']", 'through': u"orm['aishack.TrackTutorials']", 'symmetrical': 'False'})
        },
        u'aishack.tracktutorials': {
            'Meta': {'object_name': 'TrackTutorials'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'order': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'track': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['aishack.Track']"}),
            'tutorial': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['aishack.Tutorial']"})
        },
        u'aishack.tutorial': {
            'Meta': {'object_name': 'Tutorial'},
            'author': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['auth.User']"}),
            'category': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['aishack.Category']"}),
            'content': ('django.db.models.fields.TextField', [], {}),
            'content_md': ('django.db.models.fields.TextField', [], {}),
            'date': ('django.db.models.fields.DateField', [], {}),
            'excerpt': ('django.db.models.fields.CharField', [], {'max_length': '512', 'blank': 'True'}),
            'featured': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'post_image': ('django.db.models.fields.files.ImageField', [], {'max_length': '256'}),
            'read_count': ('django.db.models.fields.BigIntegerField', [], {'default': '0'}),
            'related': ('django.db.models.fields.related.ManyToManyField', [], {'related_name': "'related_rel_+'", 'blank': 'True', 'to': u"orm['aishack.Tutorial']"}),
            'series': ('django.db.models.fields.related.ForeignKey', [], {'default': 'None', 'to': u"orm['aishack.TutorialSeries']", 'null': 'True', 'blank': 'True'}),
            'slug': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '128'}),
            'title': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '128'})
        },
        u'aishack.tutorialread': {
            'Meta': {'object_name': 'TutorialRead'},
            'date': ('django.db.models.fields.DateField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'tutorial': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['aishack.Tutorial']"}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['aishack.AishackUser']"})
        },
        u'aishack.tutorialseries': {
            'Meta': {'object_name': 'TutorialSeries'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'default': "''", 'max_length': '256', 'blank': 'True'}),
            'tutorials': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['aishack.Tutorial']", 'through': u"orm['aishack.TutorialSeriesOrder']", 'symmetrical': 'False'})
        },
        u'aishack.tutorialseriesorder': {
            'Meta': {'ordering': "('order',)", 'object_name': 'TutorialSeriesOrder'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'order': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'series': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['aishack.TutorialSeries']"}),
            'tutorial': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['aishack.Tutorial']"})
        },
        u'aishack.usertrack': {
            'Meta': {'object_name': 'UserTrack'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'signup_date': ('django.db.models.fields.DateField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'track': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['aishack.Track']"}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['aishack.AishackUser']"})
        },
        u'auth.group': {
            'Meta': {'object_name': 'Group'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        u'auth.permission': {
            'Meta': {'ordering': "(u'content_type__app_label', u'content_type__model', u'codename')", 'unique_together': "((u'content_type', u'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['contenttypes.ContentType']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        u'auth.user': {
            'Meta': {'object_name': 'User'},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'related_name': "u'user_set'", 'blank': 'True', 'to': u"orm['auth.Group']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'related_name': "u'user_set'", 'blank': 'True', 'to': u"orm['auth.Permission']"}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        u'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        }
    }

    complete_apps = ['aishack']