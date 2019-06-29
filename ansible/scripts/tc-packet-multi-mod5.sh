#!/bin/sh

# sudo tc qdisc del dev eth0 root 

# reset the qdisc
tc qdisc del dev eth0 root 

#-------
# Threshold 'kubectl get nodes -o wide' start failing
#-------
tc qdisc add dev eth0 root netem delay 400ms 10ms 25% loss 30% corrupt 15% duplicate 5%

# cluster 
#  jet-b status cycle: Ready -> NotReady -> Ready
# Response time too slow
# Grafana "Node Exporter Full" dashboard for nano-a, jet-b, jet-j does not show data correctly

#--- nano-a ping statistics ---
#100 packets transmitted, 50 received, +2 duplicates, 50% packet loss, time 99905ms
#rtt min/avg/max/mdev = 782.633/800.716/819.473/7.653 ms



