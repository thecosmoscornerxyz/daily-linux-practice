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

figlet "System"
line
{
	blue "Linux Warmup"
	line
	echo "User: $(whoami)"
	echo "Hostname: $(hostname)"
	echo "Today is: $(date)"
	echo "Uptime: $(uptime -p)"
	line
	{
		blue "Disk Usage"
		df -h /
	} | bubble
	{
		blue "IP Address:"
		ip -brief addr
	} | bubble
	{
		blue "SSH Service:"
		systemctl is-active ssh || systemctl status ssh | head -n 10
	} | bubble
} | bubble
