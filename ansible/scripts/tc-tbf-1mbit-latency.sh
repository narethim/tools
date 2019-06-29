#!/bin/sh

# sudo tc qdisc del dev eth0 root 
# reset the qdisc

tc qdisc del dev eth0 root 

#
# Bandwidth limiting with 'Token Bucket Filtering' (TBF)
#
# sudo tc qdisc add dev eth0 root tbf rate 1mbit burst 32kbit latency 100ms
#

tc qdisc add dev eth0 root tbf rate 1mbit burst 32kbit latency 100ms
