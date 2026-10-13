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
		blue "Disk Usage:"
		line
		{
			df -h /
		} | bubble
	} | bubble
	line
	{
		blue "IP Address:"
		line
		{
			ip -brief addr
		} | bubble
	} | bubble
	line
	{
		blue "SSH Service:"
		line
		{
			systemctl is-active ssh || systemctl status ssh | head -n 10 2>/dev/null
		} | bubble
	} | bubble
} | bubble
