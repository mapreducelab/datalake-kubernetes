all: spark
spark: build push clean
.PHONY: build push clean

SPARK_VER = 2.3.1
HADOOP_VER = 2.8.5
HIVE_VER = 3.1.0
SCALA_VER = 2.11
BASE_IMAGE = centos7.5.1804

SPARK_TAG = 0.3.1
IMAGE_NAME = spark
REGISTRY = art-hq.intranet.qualys.com:5001
REPO = datalake

build:
	docker build \
		--build-arg SPARK_VER=${SPARK_VER} \
		--build-arg HADOOP_VER=${HADOOP_VER} \
		--build-arg HIVE_VER=${HIVE_VER} \
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
