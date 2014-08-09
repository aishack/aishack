from django.contrib import admin
from aishack.models import Tutorial, Track, TrackTutorials, Category, AishackUser
from django.contrib.auth.models import User

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

# Custom attributes on the user
class AishackUserInline(admin.StackedInline):
    model = AishackUser
    can_delete = False

class UserAdmin(admin.ModelAdmin):
    inlines = (AishackUserInline,)

admin.site.unregister(User)
admin.site.register(User, UserAdmin)

