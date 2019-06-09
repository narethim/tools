# Setup Node Exporter

## Prepare the environment

### Create 2 users: prometheus and node_exporter

```sh
sudo useradd --no-create-home --shell /usr/sbin/nologin prometheus
sudo useradd --no-create-home --shell /bin/false node_exporter

sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /var/lib/prometheus

```

## Install

1. Download the latest version of Node Exporter

```sh
wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar zxvf node_exporter-0.18.1.linux-amd64.tar.gz
sudo cp node_exporter-0.18.1.linux-amd64/node_exporter /usr/local/bin
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

rm -fr node_exporter-0.18.1.linux-amd64.tar.gz node_exporter-0.18.1.linux-amd64
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
