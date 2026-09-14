#!/usr/bin/env bash

line () {
	printf '%*s' 50 '' | tr ' ' '-'
	echo
}

bubble () {
	gum style --border rounded
}

blue () {
	gum style --foreground 39 "$@"
}

figlet Network
line
{
	blue "ip" | bubble
	ip -brief addr
	line
	blue "route" | bubble
	ip route
	line
	blue "DNS" | bubble
	dig + short google.com | nslookup google.com
	line
	blue "open ports" | bubble
	ss -tulnp | head -n 10
	line 
	blue "tcpdump" | bubble
	sudo timeout 10 tcpdump -n -i any | head -n 30
	line
	blue "nmap" | bubble
	sudo nmap -Pn 127.0.0.1
	line
	blue "ARP" | bubble
	ip neigh
} | bubble
