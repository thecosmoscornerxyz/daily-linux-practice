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
		blue "Boogers"
		line
		cat boogers.md
	} | bubble
	line
	{
		blue "Identify File Type"
		line
		file boogers.md
	} | bubble
	line
	{
		blue "Inspect Executable Type"
		line
		file /bin/bash
	} | bubble
	line
	{
		blue "Inspect File Type"
		line
		file /etc/passwd
	} | bubble
} | bubble
