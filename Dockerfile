FROM ubuntu:bionic

RUN apt update
RUN apt -y install rsync openssh-client


# Label
LABEL "com.github.actions.name"="Deploy with rsync"
LABEL "maintainer"="Obinna Odirionye <odirionye@mail.com>"


ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]