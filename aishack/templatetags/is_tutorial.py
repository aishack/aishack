from django.template import Library
from aishack.models import Tutorial

register = Library()

@register.filter
def is_tutorial(value):
    """
    Filter returns a list from range(value)
    """

    return (value.__class__ == Tutorial)
