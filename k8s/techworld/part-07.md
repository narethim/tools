# Kubernetes YAML File simply explained for Beginners

Articles in DEV (dev.to):

* [Kubernetes YAML File simply explained for Beginners](https://dev.to/techworld_with_nana/kubernetes-yaml-file-simply-explained-for-beginners-3g9e)

```sh
git clone https://gitlab.com/nanuchi/kubernetes-tutorial-series-youtube.git

cd kubernetes-tutorial-series-youtube.git/kubernetes-configuration-file-explained

ls -l

total 12
-rw-rw-r-- 1 nim nim 2162 Oct  6 10:17 nginx-deployment-result.yaml
-rw-rw-r-- 1 nim nim  341 Oct  6 10:17 nginx-deployment.yaml
-rw-rw-r-- 1 nim nim  161 Oct  6 10:17 nginx-service.yaml
```

## Steps

Initial status:

```sh
kubectl get node

kubectl get pod

kubectl get service

# get all
kubectl get all -o wide
```

Create deployment and service

```sh
kubectl apply -f nginx-deployment.yaml

kubectl apply -f nginx-service.yaml
```

Get status after applying deployment and service

```sh
kubectl get pod

kubectl get service

kubectl get all -o wide
```

Get detail about `nginx-service` service

```sh
kubectl describe service nginx-service
```

Get detail about `nginx-deployment` deployment in yaml format

```sh
kubectl get deployment nginx-deployment -o yaml
```

Get detail about `nginx-deployment` deployment in yaml format and save to a file.

```sh
kubectl get deployment nginx-deployment -o yaml > nginx-deployment-result.yml
```

## Cleanup

```sh
# delete deployment
kubectl delete -f nginx-deployment.yaml

# delete service
kubectl delete -f nginx-service.yaml
```

Verify that it is clean

```sh
kubectl get all -o wide
```
