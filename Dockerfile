
FROM maven:3.3-jdk-8

MAINTAINER Javier Cabezas Gívica y Eugenio F. González Martín 

# Environment variable describing the repositories to be verified on : Github,Bower,NPN,Archiva and Maven
 
ENV REPOSITORIES config.json

#Environment variable with java jar file

ENV JAVAJAR VCheckerApp-0.0.1-SNAPSHOT-jar-with-dependencies.jar

# Copying the contents of the current directory into /usr/src/mymaven/ (i.e. the jar file mainly)

COPY $PWD /usr/src/mymaven/

# Making mymaven our working directory (on which we also have the jar file)

WORKDIR /usr/src/mymaven

#
# Set up of required permissions to execute the jar file  
#

RUN chmod 777 $JAVAJAR

# Updating packages

RUN apt-get update

# Installing NPM

RUN apt-get install -y nodejs

RUN apt-get install -y npm

# Installing BOWER

RUN npm install -g bower

# Creating the entrypoint for the Docker

#ENTRYPOINT java -jar $JAVAJAR $REPOSITORIES 

