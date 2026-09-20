#!/usr/bin/env bash

line () {
	printf '%*s' 50 '' | tr ' ' '-'
	echo
}

blue () {
	gum style --foreground 39 "$@"
}

bubble () {
	gum style --border rounded
}

figlet "Network"
line
{
	blue "ip address:" | bubble
	ip -brief addr
	line
	blue "route" | bubble
	ip route
	line
	blue "DNS" | bubble
	dig + short google.com | nslookup google.com
	line
	blue "Open Ports" | bubble
	ss -tulnp | head -n 10
	line
	blue "TCPDUMP" | bubble
	sudo timeout 10 tcpdump -n -i any | head -n 30
	line
	blue "nmap" | bubble
	sudo nmap -Pn 127.0.0.1
	line
	blue "ARP" | bubble
	ip neigh
} | bubble
