all:
.PHONY: install upgrade delete

HELM_NAME = qlake

install:
	helm install -n $(HELM_NAME) .

upgrade:
	helm upgrade $(HELM_NAME) .

delete:
	helm delete --purge $(HELM_NAME)
