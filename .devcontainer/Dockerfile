FROM ubuntu:latest

# Update and upgrade packages
RUN apt-get update
RUN apt-get -y upgrade

# Install Git
RUN apt-get -y install git

# Install Java
RUN apt-get -y install default-jdk

# Populate the environment variables used by Java
ENV JAVA_HOME=/usr/lib/jvm/default-java
ENV PATH=$PATH:$JAVA_HOME/bin
