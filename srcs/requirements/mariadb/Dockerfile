FROM alpine:3.14

# Install mariadbJC
RUN apk update && apk upgrade \
    && apk add --no-cache --quiet --update \
    	   mariadb mariadb-client vim

RUN mkdir -p /var/lib/mysqld /run/mysqld

COPY conf/create_db.sql /tmp/create_db.sql

COPY conf/mariadb-server.cnf /etc/my.cnf.d/

COPY scripts/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]