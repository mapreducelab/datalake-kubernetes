all: hiveservice
hiveservice: build push clean
.PHONY: build push clean

HIVE_TAG = 0.1.11
IMAGE_NAME = hiveservice
REGISTRY = art-hq.intranet.qualys.com:5001
REPO = datalake

build:
	docker build -t $(REGISTRY)/$(REPO)/$(IMAGE_NAME) .
	docker tag $(REGISTRY)/$(REPO)/$(IMAGE_NAME) $(REGISTRY)/$(REPO)/$(IMAGE_NAME):$(HIVE_TAG)

push:
	docker push $(REGISTRY)/$(REPO)/$(IMAGE_NAME)
	docker push $(REGISTRY)/$(REPO)/$(IMAGE_NAME):$(HIVE_TAG)

clean:
	docker rmi $(REGISTRY)/$(REPO)/$(IMAGE_NAME):$(HIVE_TAG) || :
	docker rmi $(REGISTRY)/$(REPO)/$(IMAGE_NAME) || :
