## Emacs, make this -*- mode: sh; -*-
 
FROM granatumx/gbox-base:1.0.0

# Allow granatumx to kick off docker containers itself
RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update

RUN apt-get install -y docker-ce-cli

RUN apt-get install -y rsync

COPY aliases.sh /root/.bash_aliases
COPY .bashrc /root/.bashrc
COPY . .

ENV TERM=xterm-256color
ENV PATH="$PATH:."

ENV DOCKER_SOCKET="/var/run/docker.sock"

SHELL [ "/bin/bash", "-i", "-l", "-c" ]

CMD ./usage.sh 
