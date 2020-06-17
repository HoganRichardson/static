#!/bin/bash

## Usage ./nginxgen.sh HOSTNAME PATH

hostname=$1
app_path=$2

echo "NGINX App Generator"

echo "   -- Creating App with hostname $hostname"
echo "   -- Using UWSGI path $app_path/myapp.sock"

echo "server {
	listen 80;
	server_name $hostname;
	
	location / {
		include 	uwsgi_params;
		uwsgi_pass	unix:$app_path/myapp.sock;
	}
}" > /etc/nginx/sites-available/uwsgi_app

echo "   -- Enabling Site"
ln -s /etc/nginx/sites-available/uwsgi_app /etc/nginx/sites-enabled

echo "   NGINX Complete"
