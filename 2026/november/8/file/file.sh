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
	echo "boogers" >> boogers.md
	{
		blue "Identify File Type"
		line
		{
			file boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Find Executable Type"
		line
		{
			find /bin/bash
		} | bubble
	} | bubble
	line
	{
		blue "Inspect File Type"
		line
		{
			file /etc/passwd
		} | bubble
	} | bubble
} | bubble
