all:
.PHONY: build install upgrade

HELM_NAME = qlake
ALL_CHARTS = true 

build:
	helm dependency build charts/datalake

install: build
	helm upgrade $(HELM_NAME) --install charts/datalake --set tags.base=$(ALL_CHARTS) --set tags.alluxio=false

delete: build
	helm delete --purge $(HELM_NAME)

install-alluxio: build
	helm install -n $(HELM_NAME) charts/datalake --set tags.base=false --set tags.alluxio=true

install-monitoring:
	helm install -n monitoring-prometheus-operator charts/prometheus-operator
	helm install -n monitoring-prometheus charts/prometheus
	helm install -n monitoring-prometheus-node-exporter charts/prometheus-node-exporter
	helm install -n monitoring-grafana charts/grafana

delete-monitoring:
	helm delete --purge monitoring-grafana 
	helm delete --purge monitoring-prometheus-node-exporter 
	helm delete --purge monitoring-prometheus
	helm delete --purge monitoring-prometheus-operator 

install-minio:
	helm install -n minio charts/minio --debug

delete-minio:
	helm delete --purge minio
