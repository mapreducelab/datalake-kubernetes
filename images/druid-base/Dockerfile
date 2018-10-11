FROM centos:centos7.5.1804

ENV DRUID_VER 0.12.3

WORKDIR /opt

RUN yum -y install java-1.8.0-openjdk && \
    curl http://static.druid.io/artifacts/releases/druid-0.12.3-bin.tar.gz | tar -zx

COPY ./conf /opt/druid-${DRUID_VER}/conf
COPY ./bin/node.sh /opt/druid-${DRUID_VER}/bin/node.sh

RUN chmod +x /opt/druid-${DRUID_VER}/bin/node.sh
