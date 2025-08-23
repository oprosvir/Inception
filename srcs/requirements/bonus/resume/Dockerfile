FROM debian:bookworm

RUN apt-get update -y && \
    apt-get install -y python3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/resume
COPY site/ .

EXPOSE 8080

CMD ["python3", "-m", "http.server", "8080"]