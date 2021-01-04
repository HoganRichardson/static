#!/bin/bash

chown -R web:www-data $APP_PATH/* && \	
chmod -R 755 $APP_PATH/* 

service nginx start
uwsgi --master --ini app.ini --uid=web --gid=www-data
