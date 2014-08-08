import os
from django.test import TestCase


from aishack import settings

class SettingsTests(TestCase):
    """
    These tests go through the settings module and ensure various directories and
    installations are complete
    """
    def test_site_title(self):
        """
        The website title should remain AI Shack
        """
        self.assertEqual(settings.SITE_TITLE, 'AI Shack')

    def test_base_dir_readable(self):
        """
        The base url specified in settings.py must exist and be readable
        """
        base = settings.BASE_DIR
        self.assertTrue(os.path.exists(base))
        self.assertTrue(os.path.isdir(base))
        self.assertTrue(os.access(base, os.R_OK + os.W_OK))

    def test_templates_dir_readable(self):
        """
        Ensure templates are picked up from the correct location
        """

        temp = settings.TEMPLATE_DIRS
        for t in temp:
            self.assertTrue(os.path.exists(t))
            self.assertTrue(os.path.isdir(t))
            self.assertTrue(os.access(t, os.R_OK + os.W_OK))

    def test_social_auth_admin_search_fields(self):
        """
        Ensure the social auth search fields are set (prevents infinite recursion in 
        specific cases)
        """
        fields = settings.SOCIAL_AUTH_ADMIN_USER_SEARCH_FIELDS

        self.assertTrue('username' in fields)
        self.assertTrue('first_name' in fields)
        self.assertTrue('email' in fields)
        self.assertTrue(len(fields) == 3)

    def test_static_dir_readable(self):
        """
        Is the static dir readable?
        """

        paths = settings.STATICFILES_DIRS
        for t in paths:
            self.assertTrue(os.path.exists(t))
            self.assertTrue(os.path.isdir(t))
            self.assertTrue(os.access(t, os.R_OK + os.W_OK))

    def test_python_modules_installed(self):
        """
        Test if specific python modules are installed
        """

        import django
        django = django.VERSION
        self.assertEqual(django, (1, 6, 5, 'final', 0) )
