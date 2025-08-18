FROM debian:bookworm

RUN apt-get update -y && \
    apt-get install -y mariadb-server gettext-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/lib/mysql/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/init.sql /docker-entrypoint-initdb.d/init.sql
COPY --chmod=755 tools/entrypoint.sh /usr/local/bin/entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]