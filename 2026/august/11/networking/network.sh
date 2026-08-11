#!/usr/bin/env bash

echo "ip address:"
ip -brief addr
echo
echo "route"
ip route
echo
echo "DNS"
dig + short google.com | nslookup google.com
echo 
echo "open ports"
ss -tulnp | head -n 10
echo 
echo "tcpdump"
sudo timeout 10 -n -i any | head -n 30
echo 
echo "ARP"
ip neigh
echo
echo "nmap"
sudo nmap -Pn 127.0.0.1
