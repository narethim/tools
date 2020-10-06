# Complete Guide to setting up your Application using Kubernetes Components

Articles in DEV (dev.to):

* [Complete Guide to setting up your Application using Kubernetes Components](https://dev.to/techworld_with_nana/complete-guide-to-setting-up-your-application-using-kubernetes-components-51l4)

```sh
git clone https://gitlab.com/nanuchi/kubernetes-tutorial-series-youtube.git
```

## Steps

### 1) MongoDB Deployment

Creating the database container/pod, in which the mongodb runs.

* `mongo` in Docker Hub [mongo](https://hub.docker.com/_/mongo)
  * Standard MongoDB Port number: 27017
  * Environment ariables: MONGO_INITDB_ROOT_USERNAME, MONGO_INITDB_ROOT_PASSWORD
  * encode username using base64

    ```sh
    echo -n 'username' | base64
    echo -n 'password' | base64
    ```

* `mongo-express` in Docker Hub [mongo-express](https://hub.docker.com/_/mongo-express)
  * Standard MongoDB Port number: 27017
  * Environment ariables: ME_CONFIG_MONGODB_ADMINUSERNAME, ME_CONFIG_MONGODB_ADMINPASSWORD, ME_CONFIG_MONGODB_SERVER
  
Initial status:

```sh
kubectl get all -o wide
```

### 2) Secret

Creating the Secret component, where the username and password are stored.

Create secret

```sh
kubectl apply -f mongodb-secret.yml

# verify
kubectl get secret
```

### 3) Internal Service

Creating the service for MongoDB to be accessible by other Kubernetes components.

Create secret ( Note it is appended ai file mongodb-deployment.yml)

```sh
kubectl apply -f mongo-deployment.yml
```

### 4) Mongo Express Deployment

Creating the Mongo Express container/pod, in which the web application runs.

### 5) ConfigMap

Creating the ConfigMap component, where the server url of the MongoDB is stored.

```sh
kubectl apply -f mongo-configmap.yml

# verify
kubectl get configmap
```

Create deployment and service ( Note: make sre that configmap is created first )

```sh
kubectl apply -f mongo-express-deployment.yml
```

### 6) External Service

Creating the external service for Mongo Express to be accessible from outside the kubernetes cluster (from the browser)

```sh
# Indicate external service
type: LoadBalancer  

    nodePort: 30000
```

nodePort has a range [30000 - 32000 ?]

```sh
# Start the mongo-express GUI connection
minikube service mongo-express-service

|-----------|-----------------------|-------------|-----------------------------|
| NAMESPACE |         NAME          | TARGET PORT |             URL             |
|-----------|-----------------------|-------------|-----------------------------|
| default   | mongo-express-service |        8081 | http://192.168.99.100:30000 |
|-----------|-----------------------|-------------|-----------------------------|
🎉  Opening service default/mongo-express-service in default browser...
```

## Cleanup

```sh
# delete mongo deployment
kubectl delete -f mongo-deployment.yml

# delete mongo-express deployment
kubectl delete -f mongo-express-deployment.yml

# delete configmap
kubectl delete -f mongo-configmap.yml

# delete secret
kubectl delete -f mongo-secret.yml
```

Verify that it is clean

```sh
kubectl get all -o wide
```
