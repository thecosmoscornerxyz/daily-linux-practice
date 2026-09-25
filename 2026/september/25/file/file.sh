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
{
	echo "boogers" >> boogers.md
	{
		blue "Identify File Type"
		file boogers.md
	} | bubble
	line
	{
		blue "Inspect Executable Type"
		file /etc/bash
	} | bubble
	line
	{
		blue "Inspect File Type"
		file /etc/passwd
	} | bubble
} | bubble
