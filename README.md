# osTicket
A simple **osTicket** installation using docker and docker compose

First you need to install on your system **[Docker](https://www.docker.com/get-started)**, **[Docker-Compose](https://docs.docker.com/compose/install/)** and **[Git](https://git-scm.com/downloads)** that are cross-platform.

Get this project:

`$ git clone https://github.com/marcogarro/osticket.git`

`$ cd osticket`

Get **osTicket** from Github

`$ git clone https://github.com/osTicket/osTicket.git`

Rename ost-sampleconfig.php in ost-config.php

`$ mv osTicket/include/ost-sampleconfig.php osTicket/include/ost-config.php`

Build the WebServer Docker Image (based on php:7.3-apache)

`$ sudo docker build -t osticket .`

Edit docker-compose.yaml

Choose your MySQLDB osticket and root passwords and set the MYSQL_ROOT_PASSWORD and MYSQL_PASSWORD environment variables.

Start the service:

`$ sudo docker-compose up -d` 

Change ost-config.php permissions to 0666 

`$ chmod 0666 osTicket/include/ost-config.php`

Reach OSTicket Installation script here: http://localhost:8100

The **DB credentials** are: 

Username: osticket

Password: your_osticket_password

Host: db

After installation's complete 

Delete the setup folder

`$ rm -fr osTicket/setup`

Change ost-config.php's permissions to 0644

`$ chmod 0644 osTicket/include/ost-config.php`

To start the service run: 

`$ sudo docker-compose up -d`

To stop the service run:

`$ sudo docker-compose down`
