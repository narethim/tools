#!/bin/sh

# sudo tc qdisc del dev eth0 root 

# reset the qdisc
tc qdisc del dev eth0 root 

#-------
# Threshold 'kubectl get nodes -o wide' start failing
#-------
tc qdisc add dev eth0 root netem delay 300ms 10ms 25% loss 40% corrupt 20% duplicate 10%

# cluster 
#  jet-b status cycle: Ready -> NotReady -> Ready
# Response time too slow
# Grafana "Node Exporter Full" dashboard for nano-a, jet-b, jet-j does not show data correctly

#64 bytes from jet-b (192.168.1.131): icmp_seq=100 ttl=64 time=608 ms
#
#--- jet-b ping statistics ---
#100 packets transmitted, 25 received, +3 duplicates, 75% packet loss, time 100588ms
#rtt min/avg/max/mdev = 584.641/602.492/615.805/7.515 ms



