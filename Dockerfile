# FROM ubuntu:14.04

FROM brightlee6/docker-ubuntu-java

RUN apt-get -y update
RUN apt-get -y install curl

# SPARK
ARG SPARK_ARCHIVE=http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz
ENV SPARK_HOME /usr/local/spark-2.0.0-bin-hadoop2.7

ENV PATH $PATH:${SPARK_HOME}/bin
RUN curl -s ${SPARK_ARCHIVE} | tar -xz -C /usr/local/

WORKDIR $SPARK_HOME

# RUN apt-get update && apt-get -y install curl wget

# # JAVA         
# ARG JAVA_ARCHIVE=http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz
# ENV JAVA_HOME /usr/local/jdk1.8.0_121

# ENV PATH $PATH:$JAVA_HOME/bin
# # RUN curl -sL --retry 3 --insecure \
# #     --header "Cookie: oraclelicense=accept-securebackup-cookie;" $JAVA_ARCHIVE \
# #     | tar -xz -C /usr/local/ && ln -s $JAVA_HOME /usr/local/java 

# RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \ 
#     $JAVA_ARCHIVE | tar -xz -C /usr/local/ && ln -s $JAVA_HOME /usr/local/java 

# # SPARK
# ARG SPARK_ARCHIVE=http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz
# RUN curl -s $SPARK_ARCHIVE | tar -xz -C /usr/local/

# ENV SPARK_HOME /usr/local/spark-2.1.0-bin-hadoop2.7
# ENV PATH $PATH:$SPARK_HOME/bin

# COPY ha.conf $SPARK_HOME/conf

# EXPOSE 4040 6066 7077 8080

# WORKDIR $SPARK_HOME