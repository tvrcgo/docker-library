
FROM ubuntu:latest

WORKDIR /runner

RUN apt-get update && \
  apt-get install -y sudo curl && \
  groupadd -r runnergrp && useradd -r -g runnergrp runner && \
  echo "runner ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
  curl -O -L https://github.com/actions/runner/releases/download/v2.168.0/actions-runner-linux-x64-2.168.0.tar.gz && \
  tar xzf ./actions-runner-linux-x64-2.168.0.tar.gz && \
  ./bin/installdependencies.sh

USER runner

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
