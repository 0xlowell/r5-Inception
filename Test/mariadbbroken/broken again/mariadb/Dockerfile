FROM debian:buster

#Install php vim mariadb-client
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server vim
#mariadb-client
#RUN mkdir -p /var/run/mysqld
#RUN chown -R mysql:mysql /var/run/mysqld


#RUN mariadb-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal
RUN #mysqld_safe --datadir=/var/lib/mysql &

#RUN chown mysql:mysql /var/run/mysqld
#RUN chmod -R 755 /var/run/mysqld
#RUN chmod -R 755 /var/run/mysqld


COPY config.sh /tmp/config.sh
RUN chown -R 755 /tmp/config.sh
RUN chmod -R 755 /tmp/config.sh
RUN #rm /tmp/config.sh
#COPY server.cnf /etc/my.cnf

COPY server.cnf /etc/mysql/conf.d/mariadb.conf.d/

RUN chown -R 755 /etc/mysql/conf.d/mariadb.conf.d/
RUN chmod -R 755 /etc/mysql/conf.d/mariadb.conf.d/

ENTRYPOINT ["/bin/sh", "/tmp/config.sh"]
