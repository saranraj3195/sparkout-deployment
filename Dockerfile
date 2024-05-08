FROM ubuntu:bionic

RUN apt update && \
    apt install -y rsync openssh-client && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
