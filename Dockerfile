FROM debian:buster

RUN apt-get update -qy \
    && apt-get upgrade -qy \
    && apt-get install -qy wget php7.3-fpm php7.3-mysql php-mbstring

COPY ./srcs/* srcs_docker/

EXPOSE 80 443

ENTRYPOINT ["srcs_docker/start.sh"]