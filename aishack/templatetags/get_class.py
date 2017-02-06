from django.template import Library

register = Library()

@register.filter
def get_class(value):
    """
    Filter returns a list from range(value)
    """

    return value.__class__
