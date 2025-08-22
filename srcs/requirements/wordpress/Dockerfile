FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y php-fpm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["php-fpm8.2", "-F"]

# apt-cache policy php-fpm to check compatible version
# php-fpm8.2 for debian bookworm