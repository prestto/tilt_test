#!/bin/bash

echo "Launching migrations from migrate.sh $1"
kubectl exec deploy/example-python -- python manage.py $1 $2
