from django.conf.urls import patterns, include, url
from django.conf.urls.static import static

import settings

# Custom modules
from aishack import views

# Enable admin mode
from django.contrib import admin
from django.contrib.auth.views import login, logout

admin.autodiscover()

# Sitemaps
from django.contrib.sitemaps.views import sitemap
from aishack.views import AishackSitemap
sitemaps = {
    'aishack': AishackSitemap()
}

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'aishack.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),

    # Added for python-social-auth
    url('', include('social.apps.django_app.urls', namespace='social')),

    # login url in case you don't have JS working
    url(r'^logout/$', logout),

    url(r'^$', views.index),
    url(r'^tutorials/$', views.tutorials),
    url(r'^tutorials/(?P<slug>[a-zA-Z0-9-]+)/$', views.tutorials),
    url(r'^contribute/$', views.contribute),
    url(r'^about/$', views.about),
    url(r'^tracks/$', views.tracks),
    url(r'^tracks/signup/$', views.track_signup),
    url(r'^tracks/signup/(?P<slug>[a-zA-Z0-9-]+)/$', views.track_signup),
    url(r'^tracks/(?P<slug>[a-zA-Z0-9-]+)/$', views.tracks),
    url(r'^profile/$', views.profile),
    url(r'^profile/edit/$', views.profile_edit),
    url(r'^profile/(?P<username>[a-zA-Z0-9-]+)/$', views.profile),

    # sitemap
    url(r'^sitemap\.xml$', sitemap, {'sitemaps': sitemaps}, name='django.contrib.sitemaps.views.sitemap'),

    # Elasticsearch
    (r'^search/', include('haystack.urls')),
) + static(settings.STATIC_URL)
