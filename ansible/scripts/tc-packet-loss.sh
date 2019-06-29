#!/bin/sh

# sudo tc qdisc del dev eth0 root 

# reset the qdisc

tc qdisc del dev eth0 root 

#
# Packet loss 10%
#
# sudo tc qdisc add dev eth0 root netem loss 10%
#

tc qdisc add dev eth0 root netem loss 10%
