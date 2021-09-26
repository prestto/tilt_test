#!/usr/bin/env python
from common.models import Person


def main():
    print('Creating Tom')
    Person.objects.create(name='Tom')

    print('Creating Jack')
    Person.objects.create(name='Jack')


print('Running seed in file')
main()
