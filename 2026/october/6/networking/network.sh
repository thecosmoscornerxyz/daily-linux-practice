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
	{
		blue "IP Address:"
		line
		ip -brief addr
	} | bubble
	line
	{
		blue "Route"
		line
		ip route
	} | bubble
	line
	{
		blue "DNS"
		line
		dig + short google.com | nslookup google.com
	} | bubble
	line
	{
		blue "Open Ports"
		line
		ss -tulpn | head -n 10 2>/dev/null
	} | bubble
	line
	{
		blue "TCPDUMP"
		line
		sudo timeout 10 tcpdump -n -i any | head -n 30 2>/dev/null
	} | bubble
	line
	{
		blue "Nmap"
		line
		sudo nmap -Pn 127.0.0.1
	} | bubble
	line
	{
		blue "ARP"
		line
		ip neigh
	} | bubble
} | bubble
