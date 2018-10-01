# K8s Users

### Create user
 - `kubectl create -f users.yaml`
 - `kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')`