#!/bin/sh

set -e

sudo python manage.py wait_for_db
sudo python manage.py collectstatic --noinput
sudo python manage.py migrate

uwgi --socket :9000 --workers 4 --master --enable-threads --module app.wsgi
