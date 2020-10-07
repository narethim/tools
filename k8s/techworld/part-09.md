# Kubernetes Namespaces Explained in 15 mins

Articles in DEV (https://dev.to):

* [Kubernetes Namespaces Explained in 15 mins](https://dev.to/techworld_with_nana/kubernetes-namespaces-explained-in-15-mins-12ec)

```sh
git clone https://gitlab.com/nanuchi/kubernetes-tutorial-series-youtube.git
```

## Steps

### Explain the 4 Default Namespaces

```sh
kubectl get namespaces
```

* kubernetes-dashboard - only with minikube

* kube-system - for system use
* kube-public - publically accessible data
* kube-node-lease - lease object
* default - default namespace

### Create Namespaces

Using command line option

```sh
# create my-configmap using default namespace
kubectl apply -f my-configmap.yml
```

```sh
# create my-configmap using my-namespace namespace
kubectl apply -f my-configmap.yml --namespace=my-namespace
```

Using yaml file

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: mysql-configmap
  namespace: my-namespace
data:
  db_url: mysql-service.database
```

### volume and node 

Volume and Node ca not be created inside a namespace. They are only available within a cluster.

ConfigMap and secret can be created using a namespace and they cannot share across namespaces.

