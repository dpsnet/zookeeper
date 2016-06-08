#
# MAINTAINER        cuisongliu  <cuisongliu@qq.com>
# DOCKER-VERSION    1.8.3
#
# Dockerizing zookeeper: Dockerfile for building zookeeper  images
#
FROM  jerry/jdk:7
#FROM alpine:latest
MAINTAINER  cuisongliu <cuisongliu@qq.com>

ENV ZOO_VERSION 3.4.6

RUN mkdir -p /opt/data 
RUN mkdir -p /opt/log

WORKDIR /opt/

ADD http://soft.cuisongliu.com/zookeeper-3.4.6.tar.gz  /opt/zookeeper-3.4.6.tar.gz
RUN tar -zxvf zookeeper-$ZOO_VERSION.tar.gz && rm -rf *.tar.gz
RUN mv zookeeper-$ZOO_VERSION zookeeper
ENV ZOO_HOME /opt/zookeeper
ENV PATH $PATH:$ZOO_HOME/bin

ADD conf $ZOO_HOME/conf
ADD zkServer.sh $ZOO_HOME/bin/zkServer.sh
RUN chmod 777  $ZOO_HOME/bin/zkServer.sh 

ENV TZ "Asia/Shanghai"
EXPOSE 2181 2888 3888
CMD ["zkServer.sh", "start"]
