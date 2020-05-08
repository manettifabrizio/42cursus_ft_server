#!/bin/bash

# # phpMyAdmin version
# VERSION="4.9.5"

# # Install Nginx
# apt update -yq
# apt install -yq nginx
service nginx start

# # Install MySQL
# apt update -yq
# apt install -yq default-mysql-server
service mysql start

service php7.3-fpm start
service php7.3-fpm status

# # Install Wordpress
# wget https://wordpress.org/latest.tar.gz -O - | tar -xz -C /var/www/
# chown -R www-data:www-data /var/www/wordpress

# # Install phpMyAdmin
# apt update -yq
# wget https://files.phpmyadmin.net/phpMyAdmin/${VERSION}/phpMyAdmin-${VERSION}-english.tar.gz -O - | tar -xz -C /var/www
# mv /var/www/phpMyAdmin-${VERSION}-english /var/www/phpmyadmin
# chown -R www-data:www-data /var/www/phpmyadmin

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
