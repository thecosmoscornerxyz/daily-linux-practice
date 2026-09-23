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
	blue "Linux Warmup" | bubble
	line
	echo "User: $(whoami)"
	echo "Uptime: $(uptime -p)"
	echo "Hostname: $(hostname)"
	echo "Today is: $(date)"
	line
	blue "Disk Usage: " | bubble
	df -h /
	line
	blue "IP Address:" | bubble
	ip -brief addr
	line
	blue "SSH Service:" | bubble
	systemctl is-active ssh || systemctl status ssh | head -n 10
} | bubble
