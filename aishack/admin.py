from django.contrib import admin
from aishack.models import Tutorial, Track, TrackTutorials, Category

class TrackTutorialsInline(admin.TabularInline):
    model = TrackTutorials
    extra = 1

class TrackAdmin(admin.ModelAdmin):
    filter_horizontal = ('tutorials',)
    inlines = (TrackTutorialsInline,)

admin.site.register(Tutorial)
admin.site.register(Track, TrackAdmin)
admin.site.register(TrackTutorials)
admin.site.register(Category)
