FROM centos:centos7.5.1804 as builder

LABEL maintainer="aputra@qualys.com"

ENV HADOOP_VER 2.9.1
ENV HIVE_VER 3.1.0
ENV ALLUXIO_VER 1.8.0

WORKDIR /opt

# Get Hive and Hadoop.
RUN curl http://downloads.alluxio.org/downloads/files/${ALLUXIO_VER}/alluxio-${ALLUXIO_VER}-hadoop-2.9-bin.tar.gz | tar -zx && \
    curl http://apache.claz.org/hadoop/common/hadoop-${HADOOP_VER}/hadoop-${HADOOP_VER}.tar.gz | tar -zx && \
    curl http://apache.claz.org/hive/hive-${HIVE_VER}/apache-hive-${HIVE_VER}-bin.tar.gz | tar -zx && \
    ln -s alluxio-${ALLUXIO_VER}-hadoop-2.9/client/alluxio-${ALLUXIO_VER}-client.jar alluxio_client.jar && \
    ln -s hadoop-${HADOOP_VER} hadoop && \
    ln -s apache-hive-${HIVE_VER}-bin hive

FROM centos:centos7.5.1804

RUN yum -y install java-1.8.0-openjdk which

ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk
ENV HIVE_HOME /opt/hive
ENV HADOOP_HOME /opt/hadoop

COPY --from=builder ${HIVE_HOME} ${HIVE_HOME}/
COPY --from=builder ${HADOOP_HOME} ${HADOOP_HOME}/
COPY --from=builder /opt/alluxio_client.jar ${HIVE_HOME}/lib/

ENTRYPOINT [ "/opt/hive/bin/hive" ]
CMD [ "--service", "metastore" ]