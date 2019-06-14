# Setup Prometheus

Install Prometheus Node_Exporter v0.18.1 on an arm64 machine or VM.

# 1. Prepare the environment

Create a user: node_exporter

```sh
sudo useradd --no-create-home --shell /bin/false node_exporter
```

# 2. Setup Node Exporter

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

3. Reload `systemd` to use the newly defined service. Start `node_exporter` service. Check `node_exporter` service status.

```sh
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl status node_exporter
```

4. If everything is working enable `Node Exporter` to be started on each boot.

```sh
sudo systemctl enable node_exporter
```

5. Verify that it works fine.

[http://localhost:9100](http://localhost:9100)
[http://localhost:9100/metrics](http://localhost:9100/metrics)


