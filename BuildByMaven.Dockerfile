# The Docker file to build "docker-example-mvn" image project.

## Build ##
### sudo docker build --no-cache  -t "docker-example-mvn:0.1" -f BuildByMaven.Dockerfile .
### sudo docker images -a | grep docker-example-mvn

## Check content ##
### sudo docker image save docker-example-mvn > docker-example-mvn.tar

## Remove failed images with "none" tag if needed
### Remove all images with "none" tag or repository
### sudo docker images -a | grep none
### sudo docker rmi --force $(sudo docker images | grep "^<none" | awk '{print $3}')

## Run ##
### check environment info: sudo docker run docker-example-mvn:0.1 mvn --version
### run: sudo docker run docker-example-mvn:0.1 mvn clean install

FROM maven:3.6.0-jdk-8-alpine

MAINTAINER Stepan stepan.melnik@gmail.com

LABEL maintainer="stepan.melnik@gmail.com"
LABEL version="0.1"
LABEL description="The Docker image to build project by maven"

ENV HOME=/home/usr/app
RUN echo "Create '$HOME' folder"
RUN mkdir -p $HOME 

COPY src $HOME
COPY pom.xml $HOME
RUN cat $HOME/pom.xml

COPY settings.xml $HOME/settings.xml
RUN cat $HOME/settings.xml

WORKDIR $HOME

RUN mvn --version

RUN mvn -s settings.xml -f pom.xml clean test

CMD ["mvn", "clean", "install"]
