ARG BASE_IMAGE
FROM art-hq.intranet.qualys.com:5001/datalake/centos:${BASE_IMAGE} as builder

LABEL maintainer="aputra@qualys.com"

ENV http_proxy=http://10.113.197.252:80
ENV https_proxy=https://10.113.197.252:80

WORKDIR /opt

ARG SPARK_VER
ARG HADOOP_VER
ARG HIVE_VER
ARG ALLUXIO_VER
ARG SCALA_VER

ARG SPARK="http://apache.claz.org/spark/spark-${SPARK_VER}/spark-${SPARK_VER}-bin-without-hadoop.tgz"
ARG HADOOP="http://apache.claz.org/hadoop/common/hadoop-${HADOOP_VER}/hadoop-${HADOOP_VER}.tar.gz"
ARG HIVE="http://apache.claz.org/hive/hive-${HIVE_VER}/apache-hive-${HIVE_VER}-bin.tar.gz"
ARG ALLUXIO="http://downloads.alluxio.org/downloads/files/${ALLUXIO_VER}/alluxio-${ALLUXIO_VER}-hadoop-2.9-bin.tar.gz"
ARG CASSANDRA_JAR="http://central.maven.org/maven2/com/datastax/spark/spark-cassandra-connector_${SCALA_VER}/${SPARK_VER}/spark-cassandra-connector_${SCALA_VER}-${SPARK_VER}.jar"
ARG OJDBS="https://art-hq.intranet.qualys.com/artifactory/dev-common/ojdbc8-full.tar"

ADD ${SPARK} ${HADOOP} ${HIVE} ${ALLUXIO} ${CASSANDRA_JAR} ${OJDBS} ./

RUN mkdir -p /opt/build && \
    tar -zxf spark-${SPARK_VER}-bin-without-hadoop.tgz && \ 
    mv spark-${SPARK_VER}-bin-without-hadoop /opt/build/ && \
    tar -zxf hadoop-${HADOOP_VER}.tar.gz && \
    mv hadoop-${HADOOP_VER} /opt/build/ && \
    tar -zxf apache-hive-${HIVE_VER}-bin.tar.gz && \
    mv apache-hive-${HIVE_VER}-bin /opt/build/ && \
    tar -zxf alluxio-${ALLUXIO_VER}-hadoop-2.9-bin.tar.gz && \
    cp alluxio-${ALLUXIO_VER}-hadoop-2.9/client/alluxio-${ALLUXIO_VER}-client.jar /opt/build/spark-${SPARK_VER}-bin-without-hadoop/jars/ && \
    cp spark-cassandra-connector_2.11-2.3.1.jar /opt/build/spark-${SPARK_VER}-bin-without-hadoop/jars/ && \
    tar -xf ojdbc8-full.tar && cp OJDBC8-Full/ojdbc8.jar /opt/build/spark-${SPARK_VER}-bin-without-hadoop/jars/

COPY spark-defaults.conf hive-site.xml /opt/build/spark-${SPARK_VER}-bin-without-hadoop/conf/

FROM art-hq.intranet.qualys.com:5001/datalake/centos:${BASE_IMAGE}

ENV http_proxy=http://10.113.197.252:80
ENV https_proxy=https://10.113.197.252:80

ARG SPARK_VER
ARG HADOOP_VER
ARG HIVE_VER
ARG ALLUXIO_VER
ARG SCALA_VER_VER

ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk \
    HIVE_HOME=/opt/apache-hive-${HIVE_VER}-bin \
    SPARK_HOME=/opt/spark-${SPARK_VER}-bin-without-hadoop \
    HADOOP_HOME=/opt/hadoop-${HADOOP_VER}

ENV PATH="${PATH}:${SPARK_HOME}/bin:${HIVE_HOME}/bin:${HADOOP_HOME}/bin"

ENV SPARK_DIST_CLASSPATH="${HADOOP_HOME}/etc/hadoop:${HADOOP_HOME}/share/hadoop/common/lib/*:${HADOOP_HOME}/share/hadoop/common/*:${HADOOP_HOME}/share/hadoop/hdfs:${HADOOP_HOME}/share/hadoop/hdfs/lib/*:${HADOOP_HOME}/share/hadoop/hdfs/*:${HADOOP_HOME}/share/hadoop/yarn:${HADOOP_HOME}/share/hadoop/yarn/lib/*:${HADOOP_HOME}/share/hadoop/yarn/*:${HADOOP_HOME}/share/hadoop/mapreduce/lib/*:${HADOOP_HOME}/share/hadoop/mapreduce/*:${HADOOP_HOME}/contrib/capacity-scheduler/*.jar"

RUN yum -y install java-1.8.0-openjdk which && \
    ln -s ${SPARK_HOME} /opt/spark

COPY --from=builder /opt/build/ /opt/
COPY start-worker start-master /
