#!/usr/bin/env bash

echo "IP Info"
ip -brief addr

echo "Routes"
ip route

echo "DNS Test"
dig + short google.com || nslookup google.com 

echo "Open Listening Ports"
ss -tulnp | head -n 10

echo “tcpdump anyport”
sudo timeout 10 tcpdump -n -i any | head -n 30

echo “nmap loopback address”
nmap -Pn 127.0.0.1

echo “arp table”
ip neigh