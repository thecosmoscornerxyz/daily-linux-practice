#!/usr/bin/env bash

echo "IP"
ip -brief addr
echo
echo "Route"
ip route
echo
echo "DNS"
dig + short google | nslookup google.com
echo
echo "open ports"
ss -tulnp | head -n 10
echo
echo "TCPDUMP"
sudo timeout 10 tcpdump -n -i any | head -n 30
echo
echo "nmap"
sudo nmap -Pn 127.0.0.1
echo
echo "ARP"
ip neigh
