#!/bin/sh

# sudo tc qdisc del dev eth0 root 
# reset the qdisc

tc qdisc del dev eth0 root 

#
# Bandwidth limiting with 'Token Bucket Filtering' (TBF)
#
# sudo tc qdisc add dev eth0 root tbf rate 256kbit burst 1600 limit 3000
#

tc qdisc add dev eth0 root tbf rate 256kbit burst 1600 limit 3000
