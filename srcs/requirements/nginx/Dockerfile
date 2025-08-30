FROM debian:bookworm

RUN apt-get update -y && \
    apt-get install -y nginx openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY --chmod=755 tools/generate_ssl.sh /generate_ssl.sh

RUN /generate_ssl.sh && \
    rm /generate_ssl.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]