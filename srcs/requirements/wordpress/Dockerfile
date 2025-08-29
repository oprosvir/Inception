FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y \
    php-fpm php-mysql php-gd php-redis \
    mariadb-client \
    curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sSLo /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY --chmod=755 tools/wordpress-setup.sh /usr/local/bin/wordpress-setup.sh

EXPOSE 9000

ENTRYPOINT ["wordpress-setup.sh"]
CMD ["php-fpm8.2", "-F"]