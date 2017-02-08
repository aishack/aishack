from django.db import models

from django.contrib.auth.models import User

class Tutorial(models.Model):
    """
    This table holds information about each tutorial hosted on the website
    Tutorials can be contained within tracks - but a tutorial doesn't know that
    """
    title          = models.CharField(max_length=128)
    content        = models.TextField()
    content_md     = models.TextField()
    date           = models.DateField()
    category       = models.ForeignKey('Category')
    slug           = models.CharField(max_length=128, unique=True)
    post_image     = models.ImageField(upload_to='/static/img/tut/', max_length=256)
    post_thumb     = models.ImageField(upload_to='/static/thumb/', max_length=256, null=True)
    excerpt        = models.CharField(max_length=512, blank=True)
    author         = models.ForeignKey(User)
    related        = models.ManyToManyField('self', blank=True)
    featured       = models.BooleanField(default=False)
    read_count     = models.BigIntegerField(default=0)
    series         = models.ForeignKey('TutorialSeries', default=None, blank=True, null=True)

    def get_absolute_url(self):
        return '/tutorials/%s/' % self.slug

    def __unicode__(self):
        return self.title

class TutorialSeries(models.Model):
    name      = models.CharField(default="", blank=True, max_length=256)
    tutorials = models.ManyToManyField(Tutorial, through='TutorialSeriesOrder')

    def tutorial_list(self):
        """
        Helper function to fetch an ordered list of tutorials in this series
        Apparently, Django has no support for something like this - needs to be
        done by hand.
        """
        return [orderobj.tutorial for orderobj in TutorialSeriesOrder.objects.filter(series=self).order_by('order')]

    def first_tutorial(self):
        return TutorialSeriesOrder.objects.get(series=self, order=1).tutorial

    def __unicode__(self):
        return self.name

class TutorialSeriesOrder(models.Model):
    series   = models.ForeignKey('TutorialSeries')
    tutorial = models.ForeignKey('Tutorial')
    order    = models.IntegerField(default=0)

    class Meta:
        ordering = ('order',)

class Category(models.Model):
    prepopulated_fields = {'slug': ('title',)}
    title  = models.CharField(max_length=256, unique=True)
    desc   = models.CharField(max_length=1024, blank=True)
    slug   = models.SlugField()
    thumb  = models.CharField(max_length=1024, blank=True)
    order  = models.IntegerField(default=0)
    hidden = models.BooleanField(default=False)

    def __unicode__(self):
        return self.title

class Track(models.Model):
    """
    This table contains information about tutorial tracks
    """
    title     = models.CharField(max_length=256, unique=True)
    tutorials = models.ManyToManyField(Tutorial, through='TrackTutorials')
    thumbnail = models.CharField(max_length=255, blank=True)
    slug      = models.CharField(max_length=128, unique=True)
    excerpt   = models.CharField(max_length=255)
    description = models.CharField(max_length=1024)

    def tutorial_count(self):
        return TrackTutorials.objects.filter(track=self).values('tutorial_id').count()

    def tutorial_list(self, fields=None):
        """
        Helper function to fetch an ordered list of tutorials in this track
        """
        if fields:
            return [Tutorial.objects.filter(pk=orderobj.tutorial_id).values(*fields) for orderobj in TrackTutorials.objects.filter(track=self).order_by('order')]
        else:
            return [orderobj.tutorial for orderobj in TrackTutorials.objects.filter(track=self).order_by('order')]

    def __unicode__(self):
        return self.title

class Quiz(models.Model):
    """
    This table holds information about quizzes hosted on the website
    """
    title = models.CharField(max_length=128)

    def __unicode__(self):
        return self.title

class AishackUser(models.Model):
    """
    Extending the base User class for more attributes
    """
    user      = models.OneToOneField(User, primary_key=True)
    short_bio = models.CharField(max_length=256, blank=True)
    bio       = models.TextField(max_length=2048, blank=True)
    website   = models.URLField(blank=True)
    tutorials_read = models.ManyToManyField(Tutorial, through='TutorialRead')
    tracks_following = models.ManyToManyField(Track, through='UserTrack')

    def tutorials_read_list(self):
        """
        Helper function to fetch an ordered list of tutorials read by the user
        """
        return [orderobj.tutorial for orderobj in TutorialRead.objects.filter(user=self).order_by('date')]


    def __unicode__(self):
        return self.user.username

class TutorialRead(models.Model):
    """
    This table holds information about what all tutorials a user has read
    """
    user     = models.ForeignKey('AishackUser')
    tutorial = models.ForeignKey('Tutorial')
    date     = models.DateField(auto_now_add=True)

    def __unicode__(self):
        return "%s read '%s' on %s" % (self.user.user.username, self.tutorial.title, self.date)

class TrackTutorials(models.Model):
    """
    This table stores which tutorials belong to which tracks
    """
    track    = models.ForeignKey("Track")
    tutorial = models.ForeignKey("Tutorial")
    order    = models.IntegerField(default=0)

class UserTrack(models.Model):
    """
    This table holds which tracks a user has signed up for
    """
    user        = models.ForeignKey('AishackUser')
    track       = models.ForeignKey('Track')
    signup_date = models.DateField(auto_now_add=True)
