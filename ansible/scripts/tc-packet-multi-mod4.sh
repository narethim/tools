#!/bin/sh

# sudo tc qdisc del dev eth0 root 

# reset the qdisc
tc qdisc del dev eth0 root 


#=================================================================================================

#-------
# Threshold 'kubectl get nodes -o wide' start failing
#-------
tc qdisc add dev eth0 root netem delay 300ms 10ms 25% loss 30% corrupt 15% duplicate 5%

# cluster cycle Ready -> Not Ready -> Ready

#--- nano-a ping statistics ---
#100 packets transmitted, 45 received, +3 duplicates, 55% packet loss, time 100037ms
#rtt min/avg/max/mdev = 0.000/587.349/614.601/86.062 ms



