FROM ubuntu:bionic

RUN apt update
RUN apt -y install rsync openssh-client

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
