all: build push clean
.PHONY: build push clean

TAG = 0.2.0
IMAGE_NAME = druid-base
REGISTRY = art-hq.intranet.qualys.com:5001
REPO = datalake

build:
	docker build -t $(REGISTRY)/$(REPO)/$(IMAGE_NAME) .
	docker tag $(REGISTRY)/$(REPO)/$(IMAGE_NAME) $(REGISTRY)/$(REPO)/$(IMAGE_NAME):$(TAG)

push:
	docker push $(REGISTRY)/$(REPO)/$(IMAGE_NAME)
	docker push $(REGISTRY)/$(REPO)/$(IMAGE_NAME):$(TAG)

clean:
	docker rmi $(REGISTRY)/$(REPO)/$(IMAGE_NAME):$(TAG) || :
	docker rmi $(REGISTRY)/$(REPO)/$(IMAGE_NAME) || :
