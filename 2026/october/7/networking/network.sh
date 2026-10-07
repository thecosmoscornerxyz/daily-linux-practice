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
		ip -brief addr 2>/dev/null
	} | bubble
	line
	{
		blue "Route"
		line
		ip route 2>/dev/null
	} | bubble
	line
	{
		blue "DNS"
		line
		dig + short google.com | nslookup google.com 2>/dev/null
	} | bubble
	line
	{
		blue "Open Ports"
		line
		ss -tulnp | head -n 10 2>/dev/null
	} | bubble
	line
	{
		blue "TCPDUMP"
		line
		sudo timeout 10 tcpdump -n -i any | head -n 10 2>/dev/null
	} | bubble
	line
	{
		blue "Nmap"
		line
		sudo nmap -Pn 127.0.0.1 2>/dev/null
	} | bubble
	line
	{
		blue "ARP"
		line
		ip neigh 2>/dev/null
	} | bubble
} | bubble 
