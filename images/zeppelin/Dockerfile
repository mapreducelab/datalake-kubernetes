FROM apache/zeppelin:0.8.0

ENV HADOOP_VER 2.8.5
ENV SPARK_VER 2.3.1
ENV HIVE_VER 3.1.0

WORKDIR /opt

# For development
RUN apt-get -y install vim

# Get Hadoop.
RUN curl http://apache.claz.org/hadoop/common/hadoop-${HADOOP_VER}/hadoop-${HADOOP_VER}.tar.gz | tar -zx && \
    ln -s hadoop-${HADOOP_VER} hadoop

# Get Spark with Hadoop.
RUN curl http://apache.claz.org/spark/spark-${SPARK_VER}/spark-${SPARK_VER}-bin-without-hadoop.tgz | tar -zx && \
    ln -s spark-${SPARK_VER}-bin-without-hadoop spark

# Get spark cassandra connector
RUN curl http://central.maven.org/maven2/com/datastax/spark/spark-cassandra-connector_2.11/2.3.1/spark-cassandra-connector_2.11-2.3.1.jar -o spark-cassandra-connector_2.11-2.3.1.jar && \
    cp spark-cassandra-connector_2.11-2.3.1.jar /opt/spark-${SPARK_VER}-bin-without-hadoop/jars && \
    cp spark-cassandra-connector_2.11-2.3.1.jar ${Z_HOME}/lib

# Get OJDBS
RUN curl https://art-hq.intranet.qualys.com/artifactory/dev-common/ojdbc8-full.tar | tar -x && \
    cp OJDBC8-Full/ojdbc8.jar /opt/spark-${SPARK_VER}-bin-without-hadoop/jars && \
    cp OJDBC8-Full/ojdbc8.jar ${Z_HOME}/lib

# Get Hive.
RUN curl http://apache.claz.org/hive/hive-${HIVE_VER}/apache-hive-${HIVE_VER}-bin.tar.gz | tar -zx && \
    cp apache-hive-${HIVE_VER}-bin/lib/postgresql-metadata-storage-0.12.0.jar /opt/spark-${SPARK_VER}-bin-without-hadoop/jars && \
    cp apache-hive-${HIVE_VER}-bin/lib/postgresql-9.4.1208.jre7.jar /opt/spark-${SPARK_VER}-bin-without-hadoop/jars && \
    cp apache-hive-${HIVE_VER}-bin/lib/postgresql-metadata-storage-0.12.0.jar ${Z_HOME}/lib && \
    cp apache-hive-${HIVE_VER}-bin/lib/postgresql-9.4.1208.jre7.jar ${Z_HOME}/lib

# Get HIVE JDBC from Amazon
RUN curl -o hive_jdbc.zip http://awssupportdatasvcs.com/bootstrap-actions/Simba/AmazonHiveJDBC-1.0.9.1060.zip && \
    unzip -a hive_jdbc.zip -d hive_jdbc && \
    unzip -a hive_jdbc/AmazonHiveJDBC41-1.0.9.1060.zip -d hive_jdbc41 && \
    cp -r hive_jdbc41/* ${Z_HOME}/lib

# Get hive-jdbc 3.0.0
RUN curl -o ${Z_HOME}/lib/hive-jdbc-3.1.0.jar http://central.maven.org/maven2/org/apache/hive/hive-jdbc/3.1.0/hive-jdbc-3.1.0.jar && \
    curl -o ${Z_HOME}/lib/hive-metastore-3.1.0.jar http://central.maven.org/maven2/org/apache/hive/hive-metastore/3.1.0/hive-metastore-3.1.0.jar && \
    curl -o ${Z_HOME}/lib/hive-service-3.1.0.jar http://central.maven.org/maven2/org/apache/hive/hive-service/3.1.0/hive-service-3.1.0.jar && \
    curl -o ${Z_HOME}/lib/hive-service-rpc-3.1.0.jar http://central.maven.org/maven2/org/apache/hive/hive-service-rpc/3.1.0/hive-service-rpc-3.1.0.jar && \
    curl -o ${Z_HOME}/lib/commons-cli-1.4.jar http://central.maven.org/maven2/commons-cli/commons-cli/1.4/commons-cli-1.4.jar

ENV SPARK_HOME /opt/spark
ENV PATH $PATH:/opt/spark/bin

ADD https://art-hq.intranet.qualys.com/artifactory/third-party/datalake/hadoop-aws-2.8.5.jar /opt/spark/jars
ADD https://art-hq.intranet.qualys.com/artifactory/third-party/datalake/aws-java-sdk-core-1.11.414.jar /opt/spark/jars
ADD https://art-hq.intranet.qualys.com/artifactory/third-party/datalake/aws-java-sdk-kms-1.11.414.jar /opt/spark/jars
ADD https://art-hq.intranet.qualys.com/artifactory/third-party/datalake/aws-java-sdk-s3-1.11.414.jar /opt/spark/jars
ADD https://art-hq.intranet.qualys.com/artifactory/third-party/datalake/guava-14.0.1.jar /opt/spark/jars
ADD https://art-hq.intranet.qualys.com/artifactory/third-party/datalake/commons-collections-3.2.2.jar /opt/spark/jars
ADD https://art-hq.intranet.qualys.com/artifactory/third-party/datalake/hadoop-auth-2.8.5.jar /opt/spark/jars
ADD https://art-hq.intranet.qualys.com/artifactory/third-party/datalake/hadoop-mapreduce-client-core-2.8.5.jar /opt/spark/jars

# Get config
COPY zeppelin-site.xml ${Z_HOME}/conf
COPY interpreter-list ${Z_HOME}/conf
COPY interpreter.json ${Z_HOME}/conf
COPY log4j.properties /opt/spark/conf/log4j.properties
COPY hive-site.xml $SPARK_HOME/conf
COPY zeppelin-env.sh ${Z_HOME}/conf

WORKDIR ${Z_HOME}
