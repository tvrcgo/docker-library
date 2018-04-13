
FROM mysql:latest

RUN apt-get update
RUN apt-get -y install vim
RUN usermod -u 1000 mysql
RUN mkdir -p /var/run/mysqld
RUN chmod -R 777 /var/run/mysqld
