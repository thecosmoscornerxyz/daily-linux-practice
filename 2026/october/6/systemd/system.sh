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

figlet "SystemD"
line
{
	SERVICE=cups
	{
		blue "$SERVICE Status"
		line
		systemctl status "$SERVICE" -n 10 --no-pager 2>/dev/null
	} | bubble
	line
	{
		blue "Restarting"
		line
		sudo systemctl restart "$SERVICE" 2>/dev/null
	} | bubble
	line
	{
		blue "Enable at Boot"
		line
		sudo systemctl enable "$SERVICE" 2>/dev/null
	} | bubble
	line
	{
		blue "Disable at Boot"
		line
		sudo systemctl disable "$SERVICE" 2>/dev/null
	} | bubble
	line
	{
		blue "Stop at Boot"
		line
		sudo systemctl stop "$SERVICE" 2>/dev/null
	} | bubble
	line
	{
		blue "Final Status"
		line
		systemctl status "$SERVICE" -n 10 --no-pager 2>/dev/null
	} | bubble
} | bubble
