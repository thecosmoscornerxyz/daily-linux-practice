#!/usr/bin/env bash

line () {
	printf '%*s' 50 '' | tr ' ' '-'
	echo
}

blue () {
	gum style --foreground "$@"
}

bubble () {
	gum style --border rounded
}

figlet "System"
line
{
	{
		blue "Linux Warmup"
	} | bubble
	line
	{
		echo "User: $(whoami)"
		echo "Uptime: $(uptime -p)"
		echo "Today is: $(date)"
		echo "Hostname: $(hostname)"
	} | bubble
	line
	{
		blue "Disk Usage:"
		line
		df -h /
	} | bubble
	line
	{
		blue "IP Address:"
		line
		ip -brief addr
	} | bubble
	line
	{
		blue "SSH Service:"
		line
		systemctl is-active ssh || systemctl status | head -n 10
	} | bubble
} | bubble
