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

figlet "Network"
line
{
	{
		blue "IP Address:"
		ip -brief addr
	} | bubble
	line
	{
		blue "Route"
		ip route
	} | bubble
	line
	{
		blue "DNS"
		dig + short google.com | nslookup google.com
	} | bubble
	line
	{
		blue "TCPDUMP"
		sudo timeout 10 tcpdump -n -i any | head -n 30
	} | bubble
	line
	{
		blue "Open Ports"
		ss -tulnp | head -n 10
	} | bubble
	line
	{
		blue "Nmap"
		sudo nmap -Pn 127.0.0.1
	} | bubble
	line
	{
		blue "ARP"
		ip neigh
	} | bubble
} | bubble
