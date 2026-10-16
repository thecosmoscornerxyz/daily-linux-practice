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
		{
			file boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Inspect Executable Type"
		{
			file /bin/bash
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
