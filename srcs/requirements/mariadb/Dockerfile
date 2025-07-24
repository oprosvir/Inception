FROM debian:bookworm

RUN apt-get update -y && \
    apt-get install -y mariadb-server && \
    apt-get clean

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY tools/init.sql /docker-entrypoint-initdb.d/init.sql
# COPY tools/init.sh /tools/init.sh

RUN chmod +x /usr/local/bin/entrypoint.sh
# RUN chmod +x /tools/init.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
# ENTRYPOINT ["/tools/init.sh"]