# Setup Prometheus

Install Prometheus Node_Exporter v1.8.2 and Prometheus Server v2.10.0 on an arm64 machine such as NVIDIA Jetson TX2, Nano or VM.

## 1. Prepare the environment

Create 2 users: prometheus and node_exporter

```sh
sudo useradd --no-create-home --shell /usr/sbin/nologin prometheus
sudo useradd --no-create-home --shell /bin/false node_exporter

sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /var/lib/prometheus

```

## 2. Setup Node Exporter

`Node Exporter` is installed on every node that is to be monitored.

## Install

Download the latest version of `Node Exporter`

```sh
wget https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-arm64.tar.gz
tar zxvf node_exporter-1.8.2.linux-arm64.tar.gz
sudo cp node_exporter-1.8.2.linux-arm64/node_exporter /usr/local/bin
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

rm -fr node_exporter-1.8.2.linux-arm64.tar.gz node_exporter-1.8.2.linux-arm64
```

## Configure

Configure it to run `Node Exporter` automatically on each boot

```sh
sudo vi /etc/systemd/system/node_exporter.service
```

Copy the following into it.

```sh
[unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
```

Reload `systemd` to use the newly defined service. Start `node_exporter` service. Check `node_exporter` service status.

```sh
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl status node_exporter
```

If everything is working enable `Node Exporter` to be started on each boot.

```sh
sudo systemctl enable node_exporter
```

Verify that it works correctly.

[http://localhost:9100](http://localhost:9100)

[http://localhost:9100/metrics](http://localhost:9100/metrics)

# 3. Setup Prometheus server

## Install

Download the latest version of Prometheus

```sh
wget https://github.com/prometheus/prometheus/releases/download/v2.10.0/prometheus-2.10.0.linux-arm64.tar.gz
tar zxvf prometheus-2.10.0.linux-arm64.tar.gz

sudo cp prometheus-2.10.0.linux-arm64/prometheus /usr/local/bin
sudo cp prometheus-2.10.0.linux-arm64/promtool /usr/local/bin

sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool

sudo cp  prometheus-2.10.0.linux-amd64/prometheus.yml /etc/prometheus
sudo cp -r prometheus-2.10.0.linux-arm64/consoles /etc/prometheus
sudo cp -r prometheus-2.10.0.linux-arm64/console_libraries /etc/prometheus

sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
```

## Configure Prometheus

`sudo vi /etc/prometheus/prometheus.yml`

Append the following into it.

```sh
  - job_name: 'nodes'
    static_configs:
    - targets: ['localhost:9100', '192.168.0.126:9100']
```

Configure it to run `prometheus` automatically on each boot

`sudo vi /etc/systemd/system/prometheus.service`

Copy the following into it.

```sh
[unit]
Description=Prometheus Monitoring
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
--config.file /etc/prometheus/prometheus.yml \
--storage.tsdb.path /var/lib/prometheus \
--web.console.templates=/etc/prometheus/consoles \
--web.console.libraries=/etc/prometheus/console_libraries
ExecReload=/bin/kill -HUP $MAINPID

[Install]
WantedBy=multi-user.target
```

Reload `systemd` to use the newly defined service. Start prometheus service. Get prometheus service status.

```sh
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl status prometheus
```

If everything is working enable `Node Exporter` to be started on each boot.

```sh
sudo systemctl enable prometheus
```

# 4. Prometheus web interface

[http://localhost:9090](http://localhost:9090)

[http://localhost:9090/targets](http://localhost:9090/targets)

[http://localhost:9090/metrics](http://localhost:9090/metrics)

[http://localhost:9090/graph](http://localhost:9090/graph)

Try the following metrics:
* promhttp_metric_handler_request_total
* node_cpu_seconds_total

Click on `Execute` then select `Graph` tab.

# 5. References
[Configure a Prometeus Monitoring Server with a Grafana Dashboard](https://www.scaleway.com/en/docs/configure-prometheus-monitoring-with-grafana)
