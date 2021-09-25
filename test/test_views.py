from django.test import TestCase
from django.urls import reverse


class TestViews(TestCase):
    """Test the hello world view"""

    def setUp(self):
        self.url = reverse('index')

    def test_index_view(self):
        r = self.client.get(self.url)
        self.assertEqual(r.status_code, 200)
        self.assertEqual(r.content, b'Hello, world!')
