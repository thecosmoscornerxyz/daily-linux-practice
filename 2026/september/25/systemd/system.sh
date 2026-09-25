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
		systemctl status -u "$SERVICE" -n 10 --no-pager
	} | bubble
	line
	{
		blue "Restarting"
		sudo systemctl restart "$SERVICE"
	} | bubble
	line
	{
		blue "Enable at Boot"
		sudo systemctl enable "$SERVICE"
	} | bubble
	line
	{
		blue "Last 10 Log Lines"
		journalctl -u "$SERVICE" -n 10 --no-pager
	} | bubble
	line
	{
		blue "Disable"
		sudo systemctl disable "$SERVICE"
	} | bubble
	line
	{
		blue "Stop"
		sudo systemctl stop "$SERVICE"
	} | bubble
	line
	{
		blue "Final Status"
		systemctl -u status "$SERVICE" -n 10 --no-pager
	} | bubble
} | bubble
