FROM debian:buster

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
	&& apt-get install -qy

# Install php, Nginx, MySQL
RUN apt-get update -qy \
    && apt-get upgrade -qy \
    && apt-get install -qy 	wget \
							vim \ 
							php7.3-fpm \
							php7.3-mysql \
							nginx \
							default-mysql-server \
							php-mbstring

COPY ./srcs/* srcs_docker/
RUN mv /srcs_docker/autoindex_switch.sh /

# Install Wordpress
RUN wget https://wordpress.org/latest.tar.gz -O - | tar -xz -C /var/www/ \
	&& chown -R www-data:www-data /var/www/wordpress

# Install phpMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-english.tar.gz -O - | tar -xz -C /var/www \
	&& mv /var/www/phpMyAdmin-4.9.5-english /var/www/phpmyadmin \
	&& chown -R www-data:www-data /var/www/phpmyadmin

# Remove html
RUN rm -rf /var/www/html

EXPOSE 80 443

ENTRYPOINT ["srcs_docker/start.sh"]