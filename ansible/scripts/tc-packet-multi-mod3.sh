#!/bin/sh

# sudo tc qdisc del dev eth0 root 

# reset the qdisc
tc qdisc del dev eth0 root 

#-------
tc qdisc add dev eth0 root netem delay 300ms 10ms 25% loss 10% corrupt 5% duplicate 3%

# cluster ok
#--- jet-j ping statistics ---
#100 packets transmitted, 77 received, +3 duplicates, 23% packet loss, time 99454ms
#rtt min/avg/max/mdev = 584.595/601.681/619.965/8.604 ms


