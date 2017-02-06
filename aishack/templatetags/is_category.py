from django.template import Library
from aishack.models import Category

register = Library()

@register.filter
def is_category(value):
    """
    Filter returns a list from range(value)
    """

    return (value.__class__ == Category)
