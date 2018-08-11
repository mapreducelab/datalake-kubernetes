FROM openjdk:8-jdk-alpine as builder

LABEL maintainer="aputra@qualys.com"

ENV ALLUXIO_VER 1.8.0
ENV HADOOP_VER 2.9

ARG ALLUXIO_TARBALL=http://downloads.alluxio.org/downloads/files/${ALLUXIO_VER}/alluxio-${ALLUXIO_VER}-hadoop-${HADOOP_VER}-bin.tar.gz

ADD ${ALLUXIO_TARBALL} /opt/

RUN cd /opt && \
    (if ls | grep -q ".tar.gz"; then tar -xzf *.tar.gz && rm *.tar.gz; fi) && \
    ln -s alluxio-${ALLUXIO_VER}-hadoop-2.9 alluxio

FROM openjdk:8-jdk-alpine

RUN apk add --update bash

COPY --from=builder /opt/alluxio /opt/alluxio/
COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]