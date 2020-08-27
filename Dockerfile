# Dockerfile
# base image
FROM ubuntu:latest

# install packages & Java for tomcat
RUN apt-get update && \
	apt-get install sudo

RUN apt-get update && \
    apt-get install -y curl \
    wget \
    openjdk-8-jdk

RUN apt-get install -y less
	
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre

RUN apt-get install -y vim

# install tomcat packages
RUN useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.37/bin/apache-tomcat-9.0.37.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.37/* /opt/tomcat/
EXPOSE 8080

COPY ./postgresql-42.2.14.jar /opt/tomcat/lib

# prepare tomcat config for Pega
RUN mkdir /pega
RUN mkdir /pega/logs
RUN mkdir /pega/index
RUN mkdir /pega/temp
RUN mkdir /pega/cassandra_data

COPY ./context.xml /opt/tomcat/conf
COPY ./tomcat-users.xml /opt/tomcat/conf
COPY ./setenv.sh /opt/tomcat/bin
COPY ./prweb.war /opt/tomcat/webapps

CMD /opt/tomcat/bin/catalina.sh run

