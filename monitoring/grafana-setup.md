# 4. Grafana Setup on a Host or VM

[Grafana](https://grafana.com/)

## 4.1 Installation

Read [official Grafana documentation](https://grafana.com/grafana/download)

For Ubuntu 18.04

```sh
wget https://dl.grafana.com/oss/release/grafana_8.2.5_amd64.deb

sudo dpkg -i grafana_8.2.5_amd64.deb
```

Using `systemd` to start, status, and enable the service.

```sh
# Start
sudo systemctl start grafana-server

# Status
sudo systemctl status grafana-server

# Enable
sudo systemctl enable grafana-server
```

Using `systemd` to stop, status, and disable the service.

```sh
# Stop
sudo systemctl stop grafana-server

# Status
sudo systemctl status grafana-server

# Disable
sudo systemctl disable grafana-server
```

## 4.2 Import dashbords

Import the following dashboards:

| Num  | Description                  | Single / Multiple | Notes |
| ---- | ---------------------------- | ----------------- | ----- |
| 1860 | Node Exporter Full           | Single node       |       |
|  405 | Node Exporter Server Metrics | Multiple nodes    |       |
| 9894 | Node Exporter 0.16           | Single node       | Need Pie-chart plugin |

Importing a dashboard example:

* Select   `+ Create > Import`
* Import via grafana.com: 405, click on `Load` button
* Prometheus: Premetheus
* Select `Import` button

Get [Pie-chart plugin](https://grafana.com/plugins/grafana-piechart-panel/installation)

```sh
# Install plugins
sudo grafana-cli plugins install grafana-piechart-panel

# Restart grafana service
sudo service grafana-server restart

# Check grafana service status
sudo service grafana-server status
```

## 4.3 Web Interface

[http://localhost:3000](http://localhost:3000)

Login:

```sh
User: admin
Password: admin

Skip changing password
```
