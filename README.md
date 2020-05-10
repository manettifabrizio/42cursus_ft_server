# ft_server

  ## Description
  
  This project is intended to introduce you to the basics of system and network administration. It will allow you to install a complete web server, using a deployment technology named Docker.
  
  ## Build and Run Docker

  - Build

  ``` docker build -t test . ```

  If you have a permission error run ``` sudo usermod -aG docker <username> && newgrp docker ``` and retry to docker build.

  - Run

  ``` docker run -td --name my-nginx -p 80:80 -p 443:443 test ```

  If the 80/tcp port is occupied run ``` sudo fuser -k -n tcp 80 ``` and retry to docker run.

  - Enter the container in bash

  ``` docker exec -it my-nginx bash ```

  
