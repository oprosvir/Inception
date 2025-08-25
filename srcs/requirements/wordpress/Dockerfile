FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y php-fpm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

# phpinfo() page to test PHP processing
COPY tools/index.php /var/www/html/index.php

EXPOSE 9000

CMD ["php-fpm8.2", "-F"]