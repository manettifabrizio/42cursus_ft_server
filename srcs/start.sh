#!/bin/bash

# Start all services
service nginx start
service mysql start
service php7.3-fpm start
service php7.3-fpm status

# Add the server block to the nginx directory
cp /srcs_docker/nginx-block /etc/nginx/sites-available/nginx-block
# Create the link to enable the block
ln -s /etc/nginx/sites-available/nginx-block  /etc/nginx/sites-enabled/nginx-block

# Remove the default block
rm /etc/nginx/sites-enabled/default

# Create the MySQL detabase
mysql < /srcs_docker/data_base.sql

# Create the SSL Certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt < /srcs_docker/certificate

service nginx restart

echo -e "\e[32mSuccessful\e[0m"

/bin/bash
