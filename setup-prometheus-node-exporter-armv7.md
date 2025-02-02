# Setup Prometheus

Install Prometheus Node_Exporter v1.8.2 on an armv7 machine such as Raspberry Pi 3 Version B/B+.

## 1. Prepare the environment

Create a user: node_exporter

```sh
sudo useradd --no-create-home --shell /bin/false node_exporter
```

## 2. Setup Node Exporter

`Node Exporter` is installed on every node that is to be monitored.

### Install

Download the latest version of `Node Exporter`

```sh
wget https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-armv7.tar.gz
tar zxvf node_exporter-1.8.2.linux-armv7.tar.gz
sudo cp node_exporter-1.8.2.linux-armv7/node_exporter /usr/local/bin
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

rm -fr node_exporter-1.8.2.linux-armv7.tar.gz node_exporter-1.8.2.linux-armv7
```

### Configure

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
