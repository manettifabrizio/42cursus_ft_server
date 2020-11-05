# ft_server (100%) ✅

- ft_server (42cursus) 2019-2020
- Author = fmanetti
- Result = 100%
- Closed = 10 / 05 / 2020

## Description
  
  This project is intended to introduce you to the basics of system and network administration. It will allow you to install a complete web server, using a deployment technology named Docker.
  
## Docker Commands

  - Build

  ``` docker build -t my_nginx_img . ```

  If you have a permission error run ``` sudo usermod -aG docker <username> && newgrp docker ``` and retry to docker build.

  - Run

  ``` docker run -td --name my-nginx -p 80:80 -p 443:443 my_nginx_img ```

  If the 80/tcp port is occupied run ``` sudo fuser -k -n tcp 80 ``` and ``` docker rm my-nginx ``` after retry to run.

  - Turn OFF/ON the autoindex

  ``` docker exec -t my_nginx sh autoindex_switch.sh ```
  
  - Enter the container in bash

  ``` docker exec -it my-nginx bash ```

  - Stop the container

  ``` docker stop my-nginx ```

  
