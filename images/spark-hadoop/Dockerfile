ARG BASE_IMAGE
FROM art-hq.intranet.qualys.com:5001/datalake/centos:${BASE_IMAGE} as builder

LABEL maintainer="aputra@qualys.com"

WORKDIR /opt

ARG SPARK_VER
ARG HADOOP_VER
ARG SCALA_VER

ARG REPOSITORY="https://art-hq.intranet.qualys.com/artifactory/dev-common/datalake"
ARG SPARK="${REPOSITORY}/spark-${SPARK_VER}-bin-hadoop2.7.tar"
ARG HADOOP="http://apache.claz.org/hadoop/common/hadoop-${HADOOP_VER}/hadoop-${HADOOP_VER}.tar.gz"
ARG CASSANDRA_JAR="${REPOSITORY}/spark-cassandra-connector_${SCALA_VER}-${SPARK_VER}.jar"
ARG OJDBS="${REPOSITORY}/ojdbc8-full.tar"

ADD ${SPARK} ${HADOOP} ${CASSANDRA_JAR} ${OJDBS} ./

RUN mkdir -p /opt/build && \
    tar -xf spark-${SPARK_VER}-bin-hadoop2.7.tar && \ 
    mv spark-${SPARK_VER}-bin-hadoop2.7 /opt/build/ && \
    tar -zxf hadoop-${HADOOP_VER}.tar.gz && \
    mv hadoop-${HADOOP_VER} /opt/build/ && \
    cp spark-cassandra-connector_2.11-2.3.1.jar /opt/build/spark-${SPARK_VER}-bin-hadoop2.7/jars/ && \
    tar -xf ojdbc8-full.tar && cp OJDBC8-Full/ojdbc8.jar /opt/build/spark-${SPARK_VER}-bin-hadoop2.7/jars/

FROM art-hq.intranet.qualys.com:5001/datalake/centos:${BASE_IMAGE}

ENV http_proxy=http://10.113.197.252:80
ENV https_proxy=https://10.113.197.252:80

ARG SPARK_VER
ARG HADOOP_VER
ARG SCALA_VER_VER

ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk \
    SPARK_HOME=/opt/spark-${SPARK_VER}-bin-hadoop2.7 \
    HADOOP_HOME=/opt/hadoop-${HADOOP_VER}

ENV PATH="${PATH}:${SPARK_HOME}/bin:${HADOOP_HOME}/bin"

ENV SPARK_DIST_CLASSPATH="${HADOOP_HOME}/etc/hadoop:${HADOOP_HOME}/share/hadoop/common/lib/*:${HADOOP_HOME}/share/hadoop/common/*:${HADOOP_HOME}/share/hadoop/hdfs:${HADOOP_HOME}/share/hadoop/hdfs/lib/*:${HADOOP_HOME}/share/hadoop/hdfs/*:${HADOOP_HOME}/share/hadoop/yarn:${HADOOP_HOME}/share/hadoop/yarn/lib/*:${HADOOP_HOME}/share/hadoop/yarn/*:${HADOOP_HOME}/share/hadoop/mapreduce/lib/*:${HADOOP_HOME}/share/hadoop/mapreduce/*:${HADOOP_HOME}/contrib/capacity-scheduler/*.jar"

RUN yum -y install java-1.8.0-openjdk which && \
    ln -s ${SPARK_HOME} /opt/spark && \
    ln -s ${HADOOP_HOME} /opt/hadoop

COPY --from=builder /opt/build/ /opt/
COPY start-worker start-master /
COPY entrypoint.sh /opt/
ADD https://art-hq.intranet.qualys.com/artifactory/third-party/datalake/tini.dms /tini
RUN chmod +x /tini

ADD https://art-hq.intranet.qualys.com/artifactory/third-party/datalake/hadoop-aws-2.8.5.jar /opt/hadoop/share/hadoop/common/lib/
ADD https://art-hq.intranet.qualys.com/artifactory/third-party/datalake/aws-java-sdk-core-1.11.414.jar /opt/hadoop/share/hadoop/common/lib/
ADD https://art-hq.intranet.qualys.com/artifactory/third-party/datalake/aws-java-sdk-kms-1.11.414.jar /opt/hadoop/share/hadoop/common/lib/
ADD https://art-hq.intranet.qualys.com/artifactory/third-party/datalake/aws-java-sdk-s3-1.11.414.jar /opt/hadoop/share/hadoop/common/lib/

WORKDIR /opt/spark/work-dir

ENTRYPOINT [ "/opt/entrypoint.sh" ]
