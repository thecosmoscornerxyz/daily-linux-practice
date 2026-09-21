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

figlet "SystemD"
line
{
	SERVICE=cups
	blue "$SERVICE status" | bubble
	systemctl status -u "$SERVICE" -n 10 --no-pager
	line
	blue "Restarting" | bubble
	sudo systemctl restart "$SERVICE"
	line
	blue "Enable at Boot" | bubble
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
	systemctl status -u "$SERVICE" -n 10 --no-pager
} | bubble
