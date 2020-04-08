# Tools

Frequently used tools

## 1. Microsoft Visual Studio Code

### 1.1 Installation

[How to Install Visual Studio Code on Ubuntu 18.04](https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-18-04)

[How to Install Visual Studio Code on CentOS 7.7](https://linuxize.com/post/how-to-install-visual-studio-code-on-centos-7/)

## 2. Google Chrome browser

### 2.1 Installation

[How to install Google Chrome web browser on Ubuntu 18.04 Bionic Beaver Linux](https://linuxconfig.org/how-to-install-google-chrome-web-browser-on-ubuntu-18-04-bionic-beaver-linux)

## 3. Prometheus

[Prometheus](https://prometheus.io/)

### 3.1 Installation

#### Prometheus

* Install `Prometheus` and `Node Exporter` on `x86_64` system [here](prom-systemd-setup-x86_64.md)
* Install `Prometheus` and `Node Exporter` on `arm64` system [here](prom-systemd-setup-arm64.md)

#### Node Exporter

* Install `Node Exporter` on a `x86_64` (x86_64, VM) [here](setup-prometheus-node-exporter-x86_64.md)
* Install `Node Exporter` on a `arm64` (NVIDIA Jetson TX2, Nano) [here](setup-prometheus-node-exporter-arm64.md)
* Install `Node Exporter` on a `armv7` (Rpi 3 B/B+) [here](setup-prometheus-node-exporter-armv7.md)

Follow this instruction:
[FIRST STEPS WITH PROMETHEUS](https://prometheus.io/docs/introduction/first_steps/)

### 3.2 Exploring

[MONITORING LINUX HOST METRICS WITH THE NODE EXPORTER](https://prometheus.io/docs/guides/node-exporter/)

## 4. Grafana

[Grafana](https://grafana.com/)

### 4.1 Installation

Read [official Grafana documentation](https://grafana.com/grafana/download)

For Ubuntu 18.04

```sh
wget https://dl.grafana.com/oss/release/grafana_6.2.2_amd64.deb

sudo dpkg -i grafana_6.2.2_amd64.deb
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

### 4.2 Import dashbords

Import the following dashboards:

* 1860
* 405
* 5573
* 9894

Get [Pie-chart plugin](https://grafana.com/plugins/grafana-piechart-panel/installation)

```sh
# Install plugins
sudo grafana-cli plugins install grafana-piechart-panel

# Restart grafana service
sudo service grafana-server restart

# Check grafana service status
sudo service grafana-server status
```

### 4.3 Web Interface

[http://localhost:3000](http://localhost:3000)
