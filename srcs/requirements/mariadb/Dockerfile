FROM debian:bookworm

RUN apt-get update -y && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh

COPY tools/init.sql /docker-entrypoint-initdb.d/init.sql

RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]