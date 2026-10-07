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
	echo "boogers boogers2 boogers3" >> boogers.md
	echo "no shit sherlock" >> boogers.md
	{
		blue "Linux Warmup"
	} | bubble
	{
		echo "User: $(whoami)"
		echo "Hostname: $(hostname)"
		echo "Uptime: $(uptime -p)"
		echo "Today is: $(date)"
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
		systemctl is-active ssh || systemctl status ssh | head -n 10 2>/dev/null
	} | bubble
} | bubble
