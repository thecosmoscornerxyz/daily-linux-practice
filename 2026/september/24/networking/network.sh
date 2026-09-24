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
	{
		blue "route"
		ip route
	} | bubble
	{
		blue "DNS"
		dig + short google.com | nslookup google.com
	} | bubble
	{
		blue "tcpdump"
		sudo timeout 10 tcpdump -n -i any | head -n 30
	} | bubble
	{
		blue "open ports"
		ss -tulnp
	} | bubble
	{
		blue "nmap"
		sudo nmap -Pn 127.0.0.1
	} | bubble
	{
		blue "ARP"
		ip neigh
	} | bubble
} | bubble
