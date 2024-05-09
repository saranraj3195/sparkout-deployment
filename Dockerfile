FROM debian:stable-slim

RUN apt update
RUN apt -yq install rsync openssh-client

# Label
LABEL "com.github.actions.name"="Deploy with rsync"
LABEL "maintainer"="sparkout <saranraj.st0078@sparkouttech.com>"


ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
