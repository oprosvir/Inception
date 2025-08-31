FROM debian:bookworm-slim

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    vsftpd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY --chmod=755 tools/ftp-setup.sh /usr/local/bin/ftp-setup.sh

RUN mkdir -p /var/run/vsftpd/empty

EXPOSE 21 21100-21110

ENTRYPOINT ["ftp-setup.sh"]
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]