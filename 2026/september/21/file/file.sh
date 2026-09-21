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

figlet "File"
line
{
	echo "boogers boogers2 boogers3" >> boogers.md
	echo "no shit sherlock" >> boogers.md
	blue "Identify File Type" | bubble
	file boogers.md
	line
	blue "Inspect Executable Type" | bubble
	file /bin/bash
	line
	blue "Inspect File Type" | bubble
	file /etc/passwd
} | bubble
