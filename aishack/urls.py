from django.conf.urls import include, url
from django.conf.urls.static import static

#import settings
#import knobs
from aishack import settings, knobs

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

urlpatterns = [
    # Examples:
    # url(r'^$', 'aishack.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^$', views.index),
    url(r'^tutorials/$', views.tutorials),
    url(r'^tutorials/(?P<slug>[a-zA-Z0-9-]+)/$', views.tutorials),
    url(r'^category/(?P<slug>[a-zA-Z0-9-]+)/$', views.category),
    url(r'^contribute/$', views.contribute),
    url(r'^about/$', views.about),
    url(r'^tracks/$', views.tracks),
    url(r'^tracks/signup/$', views.track_signup),
    url(r'^tracks/signup/(?P<slug>[a-zA-Z0-9-]+)/$', views.track_signup),
    url(r'^tracks/(?P<slug>[a-zA-Z0-9-]+)/$', views.tracks),
    url(r'^profile/$', views.profile),
    url(r'^profile/edit/$', views.profile_edit),
    url(r'^profile/(?P<username>[a-zA-Z0-9-]+)/$', views.profile),
    url(r'^opencv-blueprints/$', views.opencvbook),
    url(r'^vision-scrolls/$', views.visionscrolls),
    url(r'^name-that-dataset/$', views.namethatdataset),
    url(r'^name-that-dataset/quiz/?$', views.namethatdataset_quiz),
    url(r'^google64c35c9422bb35a3.html', views.google_webmaster),

    # sitemap
    url(r'^sitemap\.xml$', sitemap, {'sitemaps': sitemaps}, name='django.contrib.sitemaps.views.sitemap'),

    # Elasticsearch
    url(r'^search/?$', views.CustomSearchView.as_view(), name='search_view')
]

if knobs.show_entropy:
    urlpatterns += [
        url(r'^entropy/$', views.entropy),
        url(r'^entropy/(?P<date>[0-9]+)$', views.entropy),
    ]

if settings.DEBUG:
    urlpatterns = urlpatterns + [url(r'^admin/', include(admin.site.urls))]
    urlpatterns = urlpatterns + static(settings.STATIC_URL)
