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
		{
			systemctl status "$SERVICE" -n 10 --no-pager 2>/dev/null
		} | bubble
	} | bubble
	line
	{
		blue "Restarting"
		line
		{
			sudo systemctl restart "$SERVICE" 2>/dev/null
		} | bubble
	} | bubble
	line
	{
		blue "Enable at Boot"
		line
		{
			sudo systemctl enable "$SERVICE" 2>/dev/null
		} | bubble
	} | bubble
	line
	{
		blue "Last 10 Log Lines"
		line
		{
			journalctl -u "$SERVICE" -n 10 --no-pager 2>/dev/null
		} | bubble
	} | bubble
	line
	{
		blue "Disable"
		line
		{
			sudo systecmtl disable "$SERVICE" 2>/dev/null
		} | bubble
	} | bubble
	line
	{
		blue "Stop"
		line
		{
			sudo systemctl stop "$SERVICE" 2>/dev/null
		} | bubble
	}  | bubble
	line
	{
		blue "Final Status"
		line
		{
			systemctl status "$SERVICE" -n 10 --no-pager 2>/dev/null
		} | bubble
	} | bubble
}  | bubble
