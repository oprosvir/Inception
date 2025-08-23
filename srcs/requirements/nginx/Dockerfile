FROM debian:bookworm

RUN apt-get update -y && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/index.html /var/www/html/index.html

# change to EXPOSE 443 when TLS (HTTPS) is configured
EXPOSE 80

# nginx runs in the foreground by default, so we can use the default CMD
# to start nginx without daemonizing it
CMD ["nginx", "-g", "daemon off;"]