FROM ubuntu:latest

# Update and upgrade packages
RUN apt-get update
RUN apt-get -y upgrade

# Install Git
RUN apt-get -y install git

# Install Java
RUN apt-get -y install default-jdk


FROM alpine:latest

# Update the APK packages index
RUN apk update

# Install Java
RUN apk add openjdk21-jdk

# Populate the environment variables used by Java
ENV JAVA_HOME=/usr/lib/jvm/default-jvm
ENV PATH=$PATH:$JAVA_HOME/bin

# Sanity check for the environment variables
RUN echo JAVA_HOME: $JAVA_HOME
RUN echo PATH: $PATH

# Confirm the Java installation by printing java version
RUN java -version

# Navigate to the directory where the Minecraft server will be installed
WORKDIR /srv/minecraft

# Install Minecraft
RUN wget "https://piston-data.mojang.com/v1/objects/59353fb40c36d304f2035d51e7d6e6baa98dc05c/server.jar"

# Create a file to accept the EULA
RUN echo eula=true > eula.txt

# Copy the server properties file. Ref: https://minecraft.wiki/w/Server.properties
COPY config/server.properties server.properties

# Copy the start script for the server and its dependencies
COPY entrypoint/start.sh scripts/start.sh
COPY entrypoint/update_server_properties.sh scripts/update_server_properties.sh
COPY entrypoint/create_config_files.sh scripts/create_config_files.sh

# Confirm that all required files are present
RUN ls
RUN ls scripts

# Expose the Minecraft port
EXPOSE 25565

# Set the entrypoint command (configure and start the server)
ENTRYPOINT ["/srv/minecraft/scripts/start.sh"]