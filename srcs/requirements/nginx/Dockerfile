FROM debian:bookworm

RUN apt-get update -y && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/default.conf /etc/nginx/conf.d/default.conf

# change to EXPOSE 443 when TLS (HTTPS) is configured
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]