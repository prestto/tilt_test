#!/bin/bash

python manage.py showmigrations

# make migrations
echo "making migrations"
python manage.py makemigrations common

# migrate the db
echo "Migrating..."
python manage.py migrate common
python manage.py showmigrations

# seed the db
echo "Seeding..."
python manage.py shell <scripts/seed.py

# run server
echo "Serving..."
python manage.py runserver
