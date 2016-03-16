#
# MAINTAINER        cuisongliu  <cuisongliu@qq.com>
# DOCKER-VERSION    1.8.3
#
# Dockerizing zookeeper: Dockerfile for building zookeeper  images
#
FROM  ubuntu:latest
MAINTAINER  cuisongliu <cuisongliu@qq.com>

ENV ZOOKEEPER_VERSION 3.4.6

RUN mkdir -p /opt/data 
RUN mkdir -p /opt/log

WORKDIR /opt/

ADD http://soft.cuisongliu.com/zookeeper-3.4.6.tar.gz  /opt/zookeeper-3.4.6.tar.gz
RUN tar -zxvf zookeeper-3.4.6.tar.gz && rm -rf *.tar.gz
RUN mv zookeeper-$ZOOKEEPER_VERSION zookeeper
ENV ZOOKEEPER_HOME /opt/zookeeper
ENV PATH $PATH:$ZOOKEEPER_HOME/bin

ADD conf $ZOOKEEPER_HOME/conf
ADD zkServer.sh $ZOOKEEPER_HOME/bin/zkServer.sh
RUN chmod 777  $ZOOKEEPER_HOME/bin/zkServer.sh 

ENV TZ "Asia/Shanghai"
EXPOSE 2181
CMD ["zkServer.sh", "start"]
