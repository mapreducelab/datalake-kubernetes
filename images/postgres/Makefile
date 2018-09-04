all: build push clean
.PHONY: build push clean

BASE_IMAGE = art-hq.intranet.qualys.com:5001/datalake/postgres:9.6.9

IMAGE_TAG = 9.6.9-hive-3.1.0
IMAGE_NAME = postgres
REGISTRY = art-hq.intranet.qualys.com:5001
REPO = datalake

build:
	docker build \
		--build-arg BASE_IMAGE=${BASE_IMAGE} \
		-t $(REGISTRY)/$(REPO)/$(IMAGE_NAME) .
	docker tag $(REGISTRY)/$(REPO)/$(IMAGE_NAME) $(REGISTRY)/$(REPO)/$(IMAGE_NAME):$(IMAGE_TAG)

push:
	docker push $(REGISTRY)/$(REPO)/$(IMAGE_NAME)
	docker push $(REGISTRY)/$(REPO)/$(IMAGE_NAME):$(IMAGE_TAG)

clean:
	docker rmi $(REGISTRY)/$(REPO)/$(IMAGE_NAME):$(IMAGE_TAG) || :
	docker rmi $(REGISTRY)/$(REPO)/$(IMAGE_NAME) || :
