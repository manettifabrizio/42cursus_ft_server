FROM debian:buster

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
	&& apt-get install -y -q

# Install php, Nginx, MySQL
RUN apt-get update -qy \
    && apt-get upgrade -qy \
    && apt-get install -qy 	wget php7.3-fpm \
							php7.3-mysql \
							nginx \
							default-mysql-server \
							php-mbstring

COPY ./srcs/* srcs_docker/

# Start all services
# RUN service nginx start \
# 	&& service nginx status \
# 	&& service mysql start \
# 	&& service php7.3-fpm start \
# 	&& service php7.3-fpm status

# Install Wordpress
RUN wget https://wordpress.org/latest.tar.gz -O - | tar -xz -C /var/www/ \
	&& chown -R www-data:www-data /var/www/wordpress

# Install phpMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-english.tar.gz -O - | tar -xz -C /var/www \
	&& mv /var/www/phpMyAdmin-4.9.5-english /var/www/phpmyadmin \
	&& chown -R www-data:www-data /var/www/phpmyadmin

EXPOSE 80 443

# # Add the server block to the nginx directory
# RUN cp /srcs_docker/nginx-block /etc/nginx/sites-available/nginx-block
# # Create the link to enable the block
# RUN ln -s /etc/nginx/sites-available/nginx-block  /etc/nginx/sites-enabled/nginx-block
# # Remove the default block
# RUN rm /etc/nginx/sites-enabled/default

# # Create the MySQL detabase
# RUN mysql < /srcs_docker/data_base.sql 
# # Create the SSL Certificate
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt < /srcs_docker/certificate

# RUN service nginx restart

ENTRYPOINT ["srcs_docker/start.sh"]