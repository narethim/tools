#!/bin/sh

# reset the qdisc
# sudo tc qdisc del dev eth0 root 

tc qdisc del dev eth0 root 


#
# Delay 200ms and random +-10ms uniform distribution with correlation value 25%
#
# sudo tc qdisc add dev eth0 root netem delay 200ms 10ms 25%
#

tc qdisc add dev eth0 root netem delay 200ms 10ms 25%
