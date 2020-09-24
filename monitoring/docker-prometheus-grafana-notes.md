# Docker + Prometheus + Grafana Stack Monitoring

## Docker preparation

```sh
docker --version

sudo systemctl status docker

sudo touch /etc/docker/daemon.json

sudo systemctl stop docker
sudo systemctl restart docker
```

```sh
# enable firewall
sudo firewall-cmd --permanent --zone=public --add-port=9323/tcp

sudo firewall-cmd --reload
```

```sh
firefox http://localhost:9323/metrics
```

modified `daemon.json`

Change 127.0.0.1 to 0.0.0.0

```sh
sudo systemctl restart docker

firefox http://localhost:9323/metrics
```

## Prometheus preparation

```sh
# Start prometheus
docker run -d --name prometheus -p 9090:9090 -v prometheus_conf:/etc/prometheus  prom/prometheus

# enable firewall
sudo firewall-cmd --permanent --zone=public --add-port=9090/tcp
```

```sh
firefox http://localhost:9090
firefox http://localhost:9090/metrics
```

```sh
docker volume ls

sudo -i
cd /var/lib/docker/volumes
ls -l

cd  prometheus_conf/_data

vi prometheus.yml

## Append the following:

  - job_name: 'docker'

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
    - targets: ['localhost:9323']
```

```sh
docker restart prometheus
docker ps
```

## Grafana preparation

```sh
# Start grafana
docker run -d --name grafana -p 3000:3000 -v grafana_config:/etc/grafana -v grafana_data:/var/lib/grafana -v grafana_logs:/var/log/grafana grafana/grafana

docker ps

# enable firewall
sudo firewall-cmd --permanent --zone=public --add-port=3000/tcp
```

```sh
firefox http://localhost:3000
```
