FROM ubuntu:20.04
MAINTAINER salma
LABEL "Customimage"="java maven"

RUN mkdir /opt/javamvnproject

WORKDIR /opt/javamvnproject
RUN apt-get update && apt-get -y install default-jre &&  apt-get -y install maven
RUN java --version && mvn --version
RUN apt-get install -y git
RUN git clone https://github.com/Salma8867/java-maven-app.git
WORKDIR /opt/javamvnproject/java-maven-app
RUN mvn clean install
CMD ["sh","scripts/deliver.sh"]
