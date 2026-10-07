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
	{
		blue "Linux Warmup"
	} | bubble
	line
	{
		echo "User: $(whoami)"
		line
		echo "Hostname: $(hostname)"
		line
		echo "Uptime: $(uptime -p)"
		line
		echo "Today is: $(date)"
	} | bubble
	line
	{
		blue "Disk Usage"
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
		systemctl is-active ssh || systemctl status ssh | head -n 10
	} | bubble
} | bubble
