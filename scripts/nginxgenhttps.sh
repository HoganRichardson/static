#!/bin/bash

## Usage ./nginxgen.sh HOSTNAME PATH

hostname=$1
app_path=$2

echo "NGINX App Generator"

echo "   -- Creating App with hostname $hostname"
echo "   -- Using UWSGI path $app_path/myapp.sock"

echo "server {
    listen 80;
    listen [::]:80;
    server_name $hostname;
    return 301 https://\$server_name\$request_uri;
}

server {
    # SSL
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    ssl_certificate /etc/ssl/home.hoganrichardson.com/fullchain.pem;
    ssl_certificate_key /etc/ssl/home.hoganrichardson.com/privkey.pem;

    location / {
        include uwsgi_params;
		uwsgi_pass	unix:$app_path/web.sock;
    }
}" > /etc/nginx/sites-available/uwsgi_app

echo "   -- Enabling Site"
ln -s /etc/nginx/sites-available/uwsgi_app /etc/nginx/sites-enabled

echo "   -- Removing default site"
rm /etc/nginx/sites-enabled/default

echo "   -- TEMP testing nginx..."
nginx -t

echo "   NGINX Complete"
