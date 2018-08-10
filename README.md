# datalake-kubernetes

Collection of docker images, helm charts and other tools needed to build DataLake on Kubernetes.

### Usage

```
helm dependency build charts/datalake
helm install -n mylake charts/datalake
```
