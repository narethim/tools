#!/bin/sh

# sudo tc qdisc del dev eth0 root 
# reset the qdisc

tc qdisc del dev eth0 root 

#
# Bandwidth limiting with 'Token Bucket Filtering' (TBF) + netem
#
# sudo tc qdisc add dev eth0 root handle 1: tbf rate 256kbit burst 1600 limit 3000
# sudo tc qdisc add dev eth0 parent 1:1 handle 10: netem delay 100ms 10ms 25% distribution normal loss 5% 25%   corrupt 5%  reorder 25% 50%

tc qdisc add dev eth0 root handle 1: tbf rate 256kbit burst 1600 limit 3000

tc qdisc add dev eth0 parent 1:1 handle 10: netem delay 100ms 10ms 25% distribution normal loss 5% 25%   corrupt 5%  reorder 25% 50%
