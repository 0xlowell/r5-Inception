FROM alpine:3.14

# Install mariadbJC
RUN apk update && apk upgrade \
    && apk add --no-cache --quiet --update \
    	   mariadb mariadb-client vim

RUN mkdir -p /var/lib/mysqld /run/mysqld


# Copy the database configuration file
COPY create_db.sql /tmp/create_db.sql

# Copy the server configuration file
COPY mariadb-server.cnf /etc/my.cnf.d/

# Copy the script to create the database
COPY conf.sh /tmp/conf.sh
RUN chmod +x /tmp/conf.sh

# Run the entrypoint script
ENTRYPOINT ["sh", "/tmp/conf.sh"]