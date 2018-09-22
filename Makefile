all:
.PHONY: build install upgrade

HELM_NAME = qlake
ALL_CHARTS = true 

build:
	helm dependency build charts/datalake

install: build
	helm install -n $(HELM_NAME) charts/datalake --set tags.base=$(ALL_CHARTS)

upgrade: build
	helm upgrade $(HELM_NAME) charts/datalake --set tags.base=$(ALL_CHARTS)

delete: build
	helm delete --purge $(HELM_NAME)

install-alluxio: build
	helm install -n $(HELM_NAME) charts/datalake --set tags.base=false --set tags.alluxio=true