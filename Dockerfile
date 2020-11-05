FROM debian:buster

# Install LAMP bundle (Linux, Nginx, Php, MySQL)
RUN apt-get update -qy		\
    && apt-get upgrade -qy	\
    && apt-get install -qy 	wget					\
							vim						\
							php7.3-fpm				\
							php7.3-mysql			\
							nginx					\
							default-mysql-server	\
							php-mbstring

# Copy all sources in the Docker Container
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

# Start all services
# Add the server block to the nginx directory sites-available
# Create the link to enable the server block
# Remove the default block from the avaible and enabled sites folders
# Create the MySQL detabase
# Create the SSL Certificate
RUN service nginx start	&& service php7.3-fpm start \
	&& cp /srcs_docker/nginx.conf /etc/nginx/sites-available/nginx.conf \
	&& ln -s /etc/nginx/sites-available/nginx.conf  /etc/nginx/sites-enabled/nginx.conf \
	&& rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default	\
	&& service mysql start && mysql -u root < /srcs_docker/data_base.sql	\
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt < /srcs_docker/certificate

# Inform Docker that the container when ran will listen on these ports
EXPOSE 80 443

# Services need to start on a bash file because if I start them with RUN, at the end of the build they will stop. 
# With ENTRYPOINT, "services_start.sh" will be executed when the image is run with "docker run".
ENTRYPOINT [ "/bin/bash", "srcs_docker/services_start.sh" ]