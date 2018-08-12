all: alluxio
alluxio: build push clean
.PHONY: build push clean

ALLUXIO_TAG = 0.1.2
IMAGE_NAME = alluxio
REGISTRY = art-hq.intranet.qualys.com:5001
REPO = datalake

build:
	docker build -t $(REGISTRY)/$(REPO)/$(IMAGE_NAME) .
	docker tag $(REGISTRY)/$(REPO)/$(IMAGE_NAME) $(REGISTRY)/$(REPO)/$(IMAGE_NAME):$(ALLUXIO_TAG)

push:
	docker push $(REGISTRY)/$(REPO)/$(IMAGE_NAME)
	docker push $(REGISTRY)/$(REPO)/$(IMAGE_NAME):$(ALLUXIO_TAG)

clean:
	docker rmi $(REGISTRY)/$(REPO)/$(IMAGE_NAME):$(ALLUXIO_TAG) || :
	docker rmi $(REGISTRY)/$(REPO)/$(IMAGE_NAME) || :
