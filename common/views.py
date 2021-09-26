from django.http import HttpResponse
from common.models import Person


def index(request):
    people = Person.objects.all()
    if people.count() == 0:
        html = 'I got no mates.'
    else:
        html = "My friends are: "
        html += ', '.join([person.name for person in people])
    return HttpResponse(html)
