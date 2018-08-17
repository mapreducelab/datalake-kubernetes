all: spark-hadoop
spark-hadoop: build push clean
.PHONY: build push clean

SPARK_VER = 2.3.1
HADOOP_VER = 2.9.1
ALLUXIO_VER = 1.8.0
SCALA_VER = 2.11
BASE_IMAGE = centos7.5.1804

SPARK_TAG = 0.2.4
IMAGE_NAME = spark-hadoop
REGISTRY = art-hq.intranet.qualys.com:5001
REPO = datalake

build:
	docker build \
		--build-arg SPARK_VER=${SPARK_VER} \
		--build-arg HADOOP_VER=${HADOOP_VER} \
		--build-arg ALLUXIO_VER=${ALLUXIO_VER} \
		--build-arg SCALA_VER=${SCALA_VER} \
		--build-arg BASE_IMAGE=${BASE_IMAGE} \
		-t $(REGISTRY)/$(REPO)/$(IMAGE_NAME) .
	docker tag $(REGISTRY)/$(REPO)/$(IMAGE_NAME) $(REGISTRY)/$(REPO)/$(IMAGE_NAME):$(SPARK_TAG)

push:
	docker push $(REGISTRY)/$(REPO)/$(IMAGE_NAME)
	docker push $(REGISTRY)/$(REPO)/$(IMAGE_NAME):$(SPARK_TAG)

clean:
	docker rmi $(REGISTRY)/$(REPO)/$(IMAGE_NAME):$(SPARK_TAG) || :
	docker rmi $(REGISTRY)/$(REPO)/$(IMAGE_NAME) || :
