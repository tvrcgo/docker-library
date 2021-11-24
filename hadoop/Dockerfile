
FROM ubuntu:18.04

RUN apt-get update && \
  apt-get install -y sudo && \
  echo "root:123456" | chpasswd && \
  echo "root   ALL=(ALL)       ALL" >> /etc/sudoers && \
  sudo apt-get install -y openjdk-8-jdk && \
  java -version
