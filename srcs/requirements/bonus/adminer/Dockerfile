FROM debian:bookworm-slim

RUN apt-get update -y && \
    apt-get install -y php php-mysqli php-cli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html
ADD https://github.com/vrana/adminer/releases/download/v5.3.0/adminer-5.3.0.php index.php

EXPOSE 8081

CMD ["php", "-S", "0.0.0.0:8081"]