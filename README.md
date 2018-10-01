# datalake-kubernetes

Collection of docker images, helm charts and other tools needed to build DataLake on Kubernetes.

## Usage
### Install Monitoring Components
```
make install make install-monitoring
```
### Delete Monitoring Components
```
make delete-monitoring
```
### Install Base Charts
```
make install or upgrade

helm dependency build charts/datalake && helm install -n mylake charts/datalake --set tags.base=true --debug

helm dependency build charts/datalake && helm install -n mylake charts/datalake --set tags.base=false --set tags.alluxio=true --debug
```

### Create tmp folder for PostgreSQL
```
export ANSIBLE_HOST_KEY_CHECKING=false; ansible -i inventory.ini kube-node --become --ask-pass -m file -a "path=/var/postgres-data state=directory"
```
