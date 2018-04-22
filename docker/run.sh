#!/bin/bash

echo "Waiting for postgresql"
timeout 30 bash -c "until pg_isready -h localhost > /dev/null 2> /dev/null; do printf '.'; sleep 1; done"
if [ "$?" -ne "0" ]; then
  echo 'timeout'
  exit 1
fi
echo 'ready'

echo 'Migrating'
python app/manage.py migrate
echo 'Running application'
python app/manage.py runserver 0.0.0.0:80
