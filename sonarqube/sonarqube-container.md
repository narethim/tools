# SonarQube setup using Docker Container

## Prerequisite

* Docker engine

## Installation

Linux Configurations and Docker commands:

Because SonarQube uses an embedded Elasticsearch, make sure that your Docker host configuration complies with the Elasticsearch production mode requirements and File Descriptors configuration

```sh
sysctl -w vm.max_map_count=262144
sysctl -w fs.file-max=65536
ulimit -n 65536
ulimit -u 4096
```

Start a basic container:

```sh
docker run -d --name sonarqube -p 9000:9000 sonarqube
```

User name : admin
Password: admin

SonarQube container with Persistent volume attached:

```sh
docker run -d -p 9000:9000 -v sonarqube_conf:/opt/sonarqube/conf -v sonarqube_extensions:/opt/sonarqube/extensions -v sonarqube_logs:/opt/sonarqube/logs -v sonarqube_data:/opt/sonarqube/data sonarqube
```

## Resources

* [SonarQube on Docker | Setup SonarQube for Code Coverage, Vulnerabilities scan, Static Code Analysis](https://www.youtube.com/watch?v=ZAfMauwNFuQ&list=PLVx1qovxj-akoYTAboxT1AbHlPmrvRYYZ&index=13)

* [DevOps | SonarQube Integration With Jenkins | SonarQube Scanner For Jenkins | Thetips4you](https://www.youtube.com/watch?v=tbr_PeAGdfo&list=PLVx1qovxj-akoYTAboxT1AbHlPmrvRYYZ&index=10) - Example [example-1](example-1.md)
