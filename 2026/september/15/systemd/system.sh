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

figlet SystemD
line
{
	SERVICE=cups
	blue "$SERVICE Status" | bubble
	systemctl -u status "$SERVICE" -n 10 --no-pager
	line
	blue "Restarting" | bubble
	sudo systemctl restart "$SERVICE"
	line
	blue "Enable At Boot" | bubble
	sudo systemctl enable "$SERVICE"
	line
	blue "Last 10 Log Lines" | bubble
	journalctl -u "$SERVICE" -n 10 --no-pager
	line
	blue "Disable" | bubble
	sudo systemctl disable "$SERVICE"
	line
	blue "Stop" | bubble
	sudo systemctl stop "$SERVICE"
	line
	blue "Final Status" | bubble
	systemctl -u status "$SERVICE" --no-pager
} | bubble
