#!/bin/bash

service nginx start
uwsgi --master --ini app.ini --uid=web --gid=www-data
