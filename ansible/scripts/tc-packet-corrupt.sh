#!/bin/sh

# sudo tc qdisc del dev eth0 root 

# reset the qdisc

tc qdisc del dev eth0 root 

#
# Packet corruption 5%
#
# sudo tc qdisc add dev eth0 root netem corrupt 5%
#

tc qdisc add dev eth0 root netem corrupt 5%
