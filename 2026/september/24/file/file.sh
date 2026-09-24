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

figlet "File"
line
{
	echo "boogers boogers2 boogers3" >> boogers.md
	{
		blue "Boogers" 
		cat boogers.md
	} | bubble
	line
	{
		blue "Identify File Type"
		file boogers.md
	} | bubble
	line
	{
		blue "Inspect Executable Type"
		file /bin/bash
	} | bubble
	line
	{
		blue "Inspect File Type"
		file /etc/passwd
	} | bubble
} | bubble
