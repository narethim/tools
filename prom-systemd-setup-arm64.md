# 1. Setup Prometheus


# 2. Prepare the environment

## Create 2 users: prometheus and node_exporter

```sh
sudo useradd --no-create-home --shell /usr/sbin/nologin prometheus
sudo useradd --no-create-home --shell /bin/false node_exporter

sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /var/lib/prometheus

```
# 3. Setup Node Exporter

Node Exporter is installed on every node that is to be monitored.

## Install

1. Download the latest version of Node Exporter

```sh
wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-arm64.tar.gz
tar zxvf node_exporter-0.18.1.linux-arm64.tar.gz
sudo cp node_exporter-0.18.1.linux-arm64/node_exporter /usr/local/bin
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

rm -fr node_exporter-0.18.1.linux-arm64.tar.gz node_exporter-0.18.1.linux-arm64
```

2. Run Node Exporter automatically on each boot

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

3. Reload 'systemd' to use the newly defined service.

```sh
sudo systemctl daemon-reload
```

4. Start node_exporter service.

```sh
sudo systemctl start node_exporter
```

5. Get node_exporter service status.

```sh
sudo systemctl status node_exporter
```

6. If everything is working enable Node Exporter to be started on each boot.

```sh
sudo systemctl enable node_exporter
```

# 4. Setup Prometheus server

1. Download the latest version of Prometheus

```sh
wget https://github.com/prometheus/prometheus/releases/download/v2.10.0/prometheus-2.10.0.linux-arm64.tar.gz
tar zxvf prometheus-2.10.0.linux-arm64.tar.gz

sudo cp prometheus-2.10.0.linux-arm64/prometheus /usr/local/bin
sudo cp prometheus-2.10.0.linux-arm64/promtool /usr/local/bin

sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool

sudo cp -r prometheus-2.10.0.linux-arm64/prometheus/consoles /etc/prometheus
sudo cp -r prometheus-2.10.0.linux-arm64/prometheus/console_libraries /etc/prometheus

sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
```

2. Configure Prometheus

`vi prometheus.yml`

`vi prometheus.service`

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

```sh
sudo cp prometheus.service /etc/systemd/system
```

3. Reload 'systemd' to use the newly defined service.

```sh
sudo systemctl daemon-reload
```

4. Start prometheus service.

```sh
sudo systemctl start prometheus
```

5. Get prometheus service status.

```sh
sudo systemctl status prometheus
```

6. If everything is working enable Node Exporter to be started on each boot.

```sh
sudo systemctl enable prometheus
```
# 5. Prometheus web interface

`http://localhost:9090`

# 6. References
[Configure a Prometeus Monitoring Server with a Grafana Dashboard](https://www.scaleway.com/en/docs/configure-prometheus-monitoring-with-grafana)
