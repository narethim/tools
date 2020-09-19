# Docker + Prometheus + Grafana Stack Monitoring

## YouTube Play list # 1-9

* [Play list 1](https://www.youtube.com/watch?v=iXJwywlNzxw&list=PLKqyiDdtB8i4ZSLCYSi-XTuEJLRKBquC4)

* [Play list # 7](https://www.youtube.com/watch?v=UChsgPLwNGY&list=PLKqyiDdtB8i4ZSLCYSi-XTuEJLRKBquC4&index=7)
Docker Container Life Cycle

```sh
docker container run -t centos /bin/bash
```

* [Play list # 8](https://www.youtube.com/watch?v=1PWr6az9sM0&list=PLKqyiDdtB8i4ZSLCYSi-XTuEJLRKBquC4&index=8)
Docker Monitoring using CAdvisor

[github.com/networknuts/docker-monitoring](https://github.com/networknuts/docker-monitoring)

```sh

docker container run -dit --name=boxtwo centos 

docker ps
docker stats

docker container run --detach=true \
 --volume=/:/rootfs:ro \
 --volume=/var/run:/var/run:rw \
 --volume=/sys:/sys:ro \
 --volume=/var/lib/docker:/var/lib/docker:ro \
 --publish=8080:8080 \
 --priviledged=true \
 --name=cadvisor \
 google/cadvisor:latest
```

* [Play list # 9](https://www.youtube.com/watch?v=Q_tmu5Wte9E&list=PLKqyiDdtB8i4ZSLCYSi-XTuEJLRKBquC4&index=9)
Docker Monitoring using cAdvisor, Prometheus, and Grafana

## Useful docker commands

```sh
docker container ls -aq

docker container stop $(docker container ls -aq)

docker container rm $(docker container ls -aq)

docker ps
docker ps -aq
```
