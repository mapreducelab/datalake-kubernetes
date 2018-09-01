# datalake-kubernetes

Collection of docker images, helm charts and other tools needed to build DataLake on Kubernetes.

## Usage

### Install Tiller
```
kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default
helm init --tiller-image=art-hq.intranet.qualys.com:5001/k8s.gcr.io/kubernetes-helm/tiller:v2.9.1
```

```
helm dependency build charts/datalake && helm install -n mylake charts/datalake --set tags.base=true --debug

helm dependency build charts/datalake && helm install -n mylake charts/datalake --set tags.base=false --set tags.alluxio=true --debug
```

### Create tmp folder for PostgreSQL
```
export ANSIBLE_HOST_KEY_CHECKING=false; ansible -i inventory.ini kube-node --become --ask-pass -m file -a "path=/var/postgres-data state=directory"
```

### Initialize schema for hive
```
k exec <pod> -- /opt/hive/bin/schematool -dbType postgres -initSchema
```