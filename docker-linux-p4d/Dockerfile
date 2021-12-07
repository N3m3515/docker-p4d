# Debian Base Image from https://hub.docker.com/r/arm32v7/debian
FROM linux_p4d-base

COPY linux-p4d/binaries/ /

RUN chmod +x /usr/local/bin/p4d

EXPOSE 1111

CMD /usr/local/bin/p4d
CMD ["bash", "tail -f /var/log/p4d.log"]
