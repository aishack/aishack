from django.conf.urls import include
from django.urls import path
from django.conf.urls.static import static

#import settings
#import knobs
from aishack import settings, knobs

# Custom modules
from aishack import views

# Enable admin mode
from django.contrib import admin
from django.contrib.auth import login, logout

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

    path(r'', views.index),
    path(r'tutorials/', views.tutorials),
    path(r'tutorials/<slug:slug>/', views.tutorials),
    path(r'category/<slug:slug>/', views.category),
    path(r'contribute/', views.contribute),
    path(r'about/', views.about),
    path(r'tracks/', views.tracks),
    path(r'tracks/signup/', views.track_signup),
    path(r'tracks/signup/<slug:slug>/', views.track_signup),
    path(r'tracks/<slug:slug>/', views.tracks),
    path(r'profile/', views.profile),
    path(r'profile/edit/', views.profile_edit),
    path(r'profile/<str:username>/', views.profile),
    path(r'opencv-blueprints/', views.opencvbook),
    path(r'vision-scrolls/', views.visionscrolls),
    path(r'name-that-dataset/', views.namethatdataset),
    path(r'name-that-dataset/quiz/?', views.namethatdataset_quiz),
    path(r'google64c35c9422bb35a3.html', views.google_webmaster),

    # sitemap
    path(r'sitemap.xml', sitemap, {'sitemaps': sitemaps}, name='django.contrib.sitemaps.views.sitemap'),

    # Elasticsearch
    path(r'search/', views.CustomSearchView.as_view(), name='search_view')
]

if knobs.show_entropy:
    urlpatterns += [
        url(r'entropy/', views.entropy),
        url(r'entropy/<int:date>', views.entropy),
    ]

if settings.DEBUG:
    urlpatterns = urlpatterns + [path(r'admin/', admin.site.urls)]
    urlpatterns = urlpatterns + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

