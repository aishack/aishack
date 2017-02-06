from django.template import Library
from aishack.models import TutorialSeries

register = Library()

@register.filter
def is_series(value):
    """
    Filter returns a list from range(value)
    """

    return (value.__class__ == TutorialSeries)
