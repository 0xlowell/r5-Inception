FROM debian:buster

#Install php vim mariadb-client
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server mariadb-client vim

RUN chown -R mysql:mysql /var/lib/mysql
#RUN mkdir -p /var/run/mysqld
#RUN chown -R mysql:mysql /var/run/mysqld

RUN #mysqld_safe --datadir=/var/lib/mysql &


#RUN chown mysql:mysql /var/run/mysqld
#RUN chmod -R 755 /var/run/mysqld
#RUN chmod -R 755 /var/run/mysqld


COPY config.sh /tmp/config.sh

#COPY server.cnf /etc/my.cnf.d
COPY server.cnf /etc/mysql/mariadb.conf.d/
ENTRYPOINT ["bash", "/tmp/config.sh"]
