# The Docker file to build "docker-example-java" image project.

## Build ##
### sudo docker build --no-cache  -t "docker-example-java:0.1" -f RunByJava.Dockerfile .
### sudo docker images -a | grep docker-example-java

## Check content ##
### sudo docker image save docker-example-java > docker-example-java.tar

## Check files in image ##
### sudo docker run --rm -it docker-example-java:0.1 find /home/usr/app


## Run ##
### check environment info: sudo docker run docker-example-java:0.1 java -version
### run: sudo docker run docker-example-java:0.1 java -cp docker-examples-java.jar com.sme.docker.examples.Main test1 test2 

FROM openjdk:8

MAINTAINER Stepan stepan.melnik@gmail.com

LABEL maintainer="stepan.melnik@gmail.com"
LABEL version="0.1"
LABEL description="The Docker image to run jar artifact by java"

ENV HOME=/home/usr/app
RUN mkdir -p $HOME 

COPY target/docker-examples-0.0.0.Dev-SNAPSHOT.jar $HOME/docker-examples-java.jar

WORKDIR $HOME

CMD ["java", "docker-examples-java.jar"]
