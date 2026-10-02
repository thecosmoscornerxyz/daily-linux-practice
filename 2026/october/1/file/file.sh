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
		file /etc/paswd
	} | bubble
} | bubble
