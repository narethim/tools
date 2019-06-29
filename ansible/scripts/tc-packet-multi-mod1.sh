#!/bin/sh

# sudo tc qdisc del dev eth0 root 

# reset the qdisc

tc qdisc del dev eth0 root 

#
# Delay 200ms and random +-10ms uniform distribution with correlation value 25% + loss 10% + corruption 5% + duplicate 3%


#-------
tc qdisc add dev eth0 root netem delay 200ms 10ms 25% loss 10% corrupt 5% duplicate 3%

# cluster ok
#--- jet-j ping statistics ---
#100 packets transmitted, 78 received, +3 duplicates, 22% packet loss, time 99442ms
#rtt min/avg/max/mdev = 386.063/401.592/422.281/8.165 ms



