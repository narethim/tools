#!/bin/sh

# sudo tc qdisc del dev eth0 root 

# reset the qdisc

tc qdisc del dev eth0 root 

#
# Packet duplicate 1%
#
# sudo tc qdisc add dev eth0 root netem duplicate 1%
#

tc qdisc add dev eth0 root netem duplicate 1%
