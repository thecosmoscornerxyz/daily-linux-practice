#!/usr/bin/env bash

line () {
	printf '%*s' 50 '' | tr ' ' '-'
	echo
}

blue () {
	gum style --forergound 39 "$@"
}

bubble () {
	gum style --border rounded
}

figlet "File"
line
{
	echo "boogers" >> boogers.md
	{
		blue "Identity File Type"
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
