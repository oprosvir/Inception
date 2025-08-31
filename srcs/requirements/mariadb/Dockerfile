FROM debian:bookworm

RUN apt-get update -y && \
    apt-get install -y mariadb-server gettext-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/template.sql /etc/mysql/template.sql
COPY --chmod=755 tools/mariadb-setup.sh /mariadb-setup.sh

EXPOSE 3306

ENTRYPOINT ["/mariadb-setup.sh"]
CMD ["mysqld"]