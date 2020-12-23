# Dockerfile
# base tomcat image - tomcat version 9.0.41 with jdk15
FROM tomcat:9.0.41-jdk8-openjdk

# install support/utility packages 
#RUN yum update -y
#RUN yum install sudo -y

#RUN yum update -y
#RUN yum install curl -y
#RUN yum install -y vim
#RUN yum install -y less
#RUN yum install -y procps


RUN apt-get update -y
RUN apt-get install sudo -y

RUN apt-get update -y
RUN apt-get install curl -y
RUN apt-get install -y vim
RUN apt-get install -y less
RUN apt-get install -y procps

RUN echo 'alias ll="ls -lrt"' >> ~/.bashrc

# prepare tomcat config for Pega
COPY ./postgresql-42.2.14.jar /usr/local/tomcat/lib
RUN mkdir /pega
RUN mkdir /pega/logs
RUN mkdir /pega/index
RUN mkdir /pega/temp
RUN mkdir /pega/cassandra_data

COPY ./context.xml /usr/local/tomcat/conf
COPY ./tomcat-users.xml /usr/local/tomcat/conf
COPY ./setenv.sh /usr/local/tomcat/bin
COPY ./prweb.war /usr/local/tomcat/webapps

CMD /usr/local/tomcat/bin/catalina.sh run

RUN mv /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/

