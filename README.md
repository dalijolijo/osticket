# osTicket
A simple **osTicket** installation using docker and docker compose

First you need to install on your system **[Docker](https://www.docker.com/get-started)**, **[Docker-Compose](https://docs.docker.com/compose/install/)** and **[Git](https://git-scm.com/downloads)** that are cross-platform.

Get this project:

`$ git clone https://github.com/marcogarro/osticket.git`

Get **osTicket** from Github

`$ git clone https://github.com/osTicket/osTicket.git`

Rename ost-sampleconfig.php in ost-config.php

`$ mv osticket/include/ost-sampleconfig.php osticket/include/ost-config.php`

Build the WebServer Docker Image (based on php:7.3-apache)

`$ docker build -t osticket .`

Edit docker-compose.yaml

Choose your MariaDB Root Password and set the MYSQL_ROOT_PASSWORD environment variable.

Enter mariadb_ost shell

`$ docker exec -it mariadb_ost /bin/sh`

Create osticket database

`# mysql -u root -p -e "CREATE DATABASE osticket"

Exit container's shell

`# exit`

Run Docker Compose to run OSticket installation

`$ docker-compose up -d`

Reach OSTicket Installation script here: http://localhost:8100

The **DB credentials** are: 

Username: root

Password: your_root_password

Host: db

After installation enter Webserver service in order to: 

- Cancel the setup folder; 
- Change permissions to 0644 (chmod 0644 include/ost-config.php)

To start the service run: 

`$ docker-compose up -d`

To stop the service run:

`$ docker-compose down`
