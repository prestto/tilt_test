#!/bin/bash

# make migrations
echo "making migrations"
python manage.py makemigrations

# migrate the db
echo "Migrating..."
python manage.py migrate --fake

# migrate the db
echo "Migrating..."
python manage.py migrate

# seed the db
echo "Seeding..."
python manage.py shell <scripts/seed.py

# run server
echo "Serving..."
python manage.py runserver
