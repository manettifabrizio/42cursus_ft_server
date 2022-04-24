<h1 align="center">
	📡 ft_server 📡
</h1>

<p align="center">
	<b><i>CURSUS: 2019/2020 - AUTHOR: fmanetti - GRADE: 100 - FINISHED: 11/05/2020</i></b><br>
</p>

<p align="center">
	This is a System Administration subject. You will discover Docker and you will set up your first web server.
</p>

![image](https://github.com/manettifabrizio/42cursus_srcs/blob/main/images/ft_server.gif)

This project is no more part of the 42cursus.

## Introduction

This topic is intended to introduce you to system administration. It will make you aware of the importance of using scripts to automate your tasks. For that, you will discover the "docker" technology and use it to install a complete web server. This server will run multiples services: Wordpress, phpMyAdmin, and a SQL database.

For more detailed information, look at the [**subject of this project**](https://github.com/manettifabrizio/42cursus_srcs/tree/main/subjects/ft_server).

## Services

- [`Nginx`](https://nginx.org/): light open source web server.
- [`Wordpress`](https://wordpress.com/): content management platform used to build your website.
- [`MySQL`](https://www.mysql.com/): open source relational darabase management sistem.
- [`phpMyAdmin`](https://www.phpmyadmin.net/): open source administration tool for MySQL and MariaDB.
- [`MariaDB`](https://mariadb.com/): open source relational darabase management sistem.

## Usage

### Requirements

To launch the server you'll need docker installed.

[`Install Docker`](https://docs.docker.com/engine/install/)


### Instructions

  - Build

  ``` docker build -t my_nginx_img . ```

  If you have a permission error run ``` sudo usermod -aG docker <username> && newgrp docker ``` and retry to docker build.

  - Run

  ``` docker run -td --name my_nginx -p 80:80 -p 443:443 my_nginx_img ```

  If the 80/tcp port is occupied run ``` sudo fuser -k -n tcp 80 ``` and ``` docker rm my_nginx ``` after retry to run.

  - Turn OFF/ON the autoindex

  ``` docker exec -t my_nginx sh autoindex_switch.sh ```
  
  - Enter the container in bash

  ``` docker exec -it my_nginx bash ```

  - Stop the container

  ``` docker stop my_nginx ```
