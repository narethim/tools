# Kubernetes Namespaces Explained in 15 mins

Articles in DEV (https://dev.to):

* [Kubernetes Namespaces Explained in 15 mins](https://dev.to/techworld_with_nana/kubernetes-namespaces-explained-in-15-mins-12ec)

```sh
git clone https://gitlab.com/nanuchi/kubernetes-tutorial-series-youtube.git
```

## Steps

Example yaml file: external service

```yaml
apiVersion: v1
kind: Service
metadata:
  name: myapp-external-service
spec:
  selector:
    app: myapp
  type: LoadBalancer
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 35010
```

Example yaml file: Ingress

```yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: myapp-ingress
spec:
  rules:
  - host: myapp.com
    http:
      paths:
      - backend:
        serviceName: myapp-internal-service
        servicePort: 8080
```

Example yaml file: internal-service

```yaml
apiVersion: v1
kind: Service
metadata:
  name: myapp-internal-service
pec:
  selector:
    app: myapp
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 8080
```

## Ingress Controller in Minikube

```sh
minikube addons enable ingress
```

```sh
kubectl get ns

kubectl get nall -n kubernetes-dashboard

```

File: dashboard-ingress.yml

```yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: dashboard-ingress
  namespace: kubernetes-dashboard
spec:
  rules:
  - host: dashboard.com
    http:
      paths:
      - backend:
        serviceName: kubernetes-dashboard
        servicePort: 80
```

```sh
kubectl apply -f dashboard-ingress.yml
```

Verify

```sh
kubectl get ingress -n kubernetes-dashboard
NAME                HOSTS           ADDRESS         PORTS   AGES
dashboard-ingress   dashboard.com   129.168.64.5    80  42s
```

Add the ip address 129.168.64.5 to /etc/hosts

```sh
kubectl describe ingress dashboard-ingress -n kubernetes-dashboard
```

### Multiple paths for same host

One domain - multiple path

```yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: simple-fanout-example
  annotation: 
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: myapp.com
    http:
      paths:
      - path: /analytics
        backend:
          serviceName: analytics-service
          servicePort: 3000
      - path: /shopping
        backend:
          serviceName: shopping-service
          servicePort: 8080
```

### Multiple sub-domains or domains

One domain - multiple path

```yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: name-virtual-host-ingress
spec:
  rules:
  - host: analytics.myapp.com
    http:
      paths:
        backend:
          serviceName: analytics-service
          servicePort: 3000
  - host: shopping.myapp.com
    http:
      paths:
        backend:
          serviceName: shopping-service
          servicePort: 8080
 ```

### Configuring TLS Certificate - https://

One domain - multiple path

File: tls-example-ingress.yml

```yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: tls-example-ingress
spec:
  tls:
  - hosts:
    - myapp.com
    secretName: myapp-secret-tls
  rules:
    - host: myapp.com
    http:
      paths:
        - path: /
        backend:
          serviceName: myapp-internal-service
          servicePort: 8080
 ```

File: myapp-secret-tls.yml

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: myapp-secret-tls
  namespace: default
data:
  tls.crt: base64 encoded cert
  tls.key: base64 encoded key
type: kubernetes.io/tls
```

```sh
kubectl apply -f myapp-secret-tls.yml

kubectl apply -f tls-example-ingress.yml
```
