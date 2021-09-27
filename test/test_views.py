from common.models import Person
from django.test import TestCase
from django.urls import reverse


class TestViews(TestCase):
    """Test the hello world view"""

    def setUp(self):
        self.url = reverse('index')

    def test_index_view(self):
        r = self.client.get(self.url)
        self.assertEqual(r.status_code, 200)
        self.assertEqual(r.content, b'I got no mates.')

    def test_index_view_with_mates(self):
        Person.objects.create(name='Bruce')
        r = self.client.get(self.url)
        self.assertEqual(r.status_code, 200)
        self.assertEqual(r.content, b'My friends are: Bruce')
