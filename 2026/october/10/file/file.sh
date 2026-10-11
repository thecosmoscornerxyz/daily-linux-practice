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
	echo "boogers" >> boogers.md
	{
		blue "Identify File Type"
		line
		file boogers.md 2>/dev/null
	} | bubble
	line
	{
		blue "Inspect Executable Type"
		line
		file /bin/bash 2>/dev/null
	} | bubble
	line
	{
		blue "Inspect File Type"
		line
		file /etc/passwd 2>/dev/null
	} | bubble
} | bubble
