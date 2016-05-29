
FROM ubuntu:14.04

MAINTAINER Javier Cabezas Gívica y Eugenio F. González Martín 

# Environment variable describing the repositories to be verified on : Github,Bower,NPN,Archiva and Maven
 
#Environment variable with java jar file

ENV JAVAJAR VCheckerApp-0.0.1-SNAPSHOT-jar-with-dependencies.jar

# Copying the contents of the current directory to the container

COPY $PWD /usr/bin

# Set up of required permissions to execute the jar file  
#

RUN chmod 777 $JAVAJAR

# Updating packages

RUN apt-get update

# Installing Java

RUN apt-get  install -y openjdk-7-jre-headless 

# Installing NPM

RUN apt-get install -y nodejs

RUN apt-get install -y npm

# Installing BOWER

RUN npm install -g bower

# Creating the entrypoint for the Docker

ENTRYPOINT java -jar /usr/bin/$JAVAJAR $CONFIGJSON 

