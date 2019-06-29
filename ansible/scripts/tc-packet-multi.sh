#!/bin/sh

# sudo tc qdisc del dev eth0 root 

# reset the qdisc

tc qdisc del dev eth0 root 

#
# Delay 200ms and random +-10ms uniform distribution with correlation value 25% + loss 10% + corruption 5% + duplicate 3%


#-------
# tc qdisc add dev eth0 root netem delay 200ms 10ms 25% loss 10% corrupt 5% duplicate 3%

# cluster ok
#--- jet-j ping statistics ---
#100 packets transmitted, 78 received, +3 duplicates, 22% packet loss, time 99442ms
#rtt min/avg/max/mdev = 386.063/401.592/422.281/8.165 ms


#-------
#tc qdisc add dev eth0 root netem delay 250ms 10ms 25% loss 10% corrupt 5% duplicate 3%

# cluster ok
#--- jet-j ping statistics ---
#100 packets transmitted, 73 received, +3 duplicates, 27% packet loss, time 99519ms
#rtt min/avg/max/mdev = 483.011/508.264/1019.885/59.583 ms


#-------
#tc qdisc add dev eth0 root netem delay 300ms 10ms 25% loss 10% corrupt 5% duplicate 3%

# cluster ok
#--- jet-j ping statistics ---
#100 packets transmitted, 77 received, +3 duplicates, 23% packet loss, time 99454ms
#rtt min/avg/max/mdev = 584.595/601.681/619.965/8.604 ms

#=================================================================================================

#-------
# Threshold 'kubectl get nodes -o wide' start failing
#-------
# tc qdisc add dev eth0 root netem delay 300ms 10ms 25% loss 30% corrupt 15% duplicate 5%

# cluster cycle Ready -> Not Ready -> Ready

#--- nano-a ping statistics ---
#100 packets transmitted, 45 received, +3 duplicates, 55% packet loss, time 100037ms
#rtt min/avg/max/mdev = 0.000/587.349/614.601/86.062 ms


#-------
# Threshold 'kubectl get nodes -o wide' start failing
#-------
#tc qdisc add dev eth0 root netem delay 400ms 10ms 25% loss 30% corrupt 15% duplicate 5%

# cluster 
#  jet-b status cycle: Ready -> NotReady -> Ready
# Response time too slow
# Grafana "Node Exporter Full" dashboard for nano-a, jet-b, jet-j does not show data correctly

#--- nano-a ping statistics ---
#100 packets transmitted, 50 received, +2 duplicates, 50% packet loss, time 99905ms
#rtt min/avg/max/mdev = 782.633/800.716/819.473/7.653 ms


#-------
# Threshold 'kubectl get nodes -o wide' start failing
#-------
#tc qdisc add dev eth0 root netem delay 300ms 10ms 25% loss 40% corrupt 20% duplicate 10%

# cluster 
#  jet-b status cycle: Ready -> NotReady -> Ready
# Response time too slow
# Grafana "Node Exporter Full" dashboard for nano-a, jet-b, jet-j does not show data correctly

#64 bytes from jet-b (192.168.1.131): icmp_seq=100 ttl=64 time=608 ms
#
#--- jet-b ping statistics ---
#100 packets transmitted, 25 received, +3 duplicates, 75% packet loss, time 100588ms
#rtt min/avg/max/mdev = 584.641/602.492/615.805/7.515 ms


