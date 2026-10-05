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

figlet "Permissions"
line
{
	{
		rm -f -v file1 file2 2>/dev/null
		touch file1 file2 2>/dev/null
	} | bubble
	line
	{
		blue "Before"
		line
		ls -l
	} | bubble
	line
	chmod 600 file1
	chmod 574 file2
	chown root:root file1 2>/dev/null
	sudo chown "$USER":"$USER" file2 2>/dev/null
	{
		blue "after"
		line
		ls -l
	} | bubble
	line
	{
		blue "file1 should be rw-------"
		blue "file2 should be rwxr-xr--"
	} | bubble
} | bubble
