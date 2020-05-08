# ft_server

  ## Description
  
  This project is intended to introduce you to the basics of system and network administration. It will allow you to install a complete web server, using a deployment technology named Docker.
  
  ## Build and Run Docker
  
  ### macOS

  - Build 
  
 ``` docker build -t test .  ```
  
  - Run
  
  ``` docker run --rm -it -p 80:80 -p 443:443 test ```

  ### Ubuntu 18.04

  - Build

  ``` docker build -t test . ```

  - Run

  ``` docker run -td --name my-nginx -p 80:80 -p 443:443 test ```

  If the 80/tcp port is occupied run:

  ``` sudo fuser -k -n tcp 80 ```

  And retry.

  - Enter the container in bash

  ``` docker exec -it my-nginx bash ```

  
