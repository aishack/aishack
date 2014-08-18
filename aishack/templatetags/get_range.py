from django.template import Library

register = Library()

@register.filter
def get_range(value):
    """
    Filter returns a list from range(value)
    """

    return range(value)
