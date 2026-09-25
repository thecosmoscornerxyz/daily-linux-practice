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
		ip -brief addr
	} | bubble
	line
	{
		blue "route"
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
		blue "NMap"
		sudo nmap -Pn 127.0.0.1
	} | bubble
	line
	{
		blue "ARP"
		ip neigh
	} | bubble
} | bubble
