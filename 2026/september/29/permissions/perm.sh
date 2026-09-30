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

figlet "Permissions"
line
{
	{
		rm -r -v file1 file2
		touch file1 file2 2> /dev/null
	} | bubble
	line
	{
		blue "Before"
		ls -l
	} | bubble
	chmod 600 file1
	chmod 754 file2
	chown root:root file1
	sudo chown "$USER":"$USER" file2
	{
		blue "after"
		ls -l
	} | bubble
	line
	{
		blue "file1 should be rw-------"
		blue "file2 should be rwxr-xr--"
	} | bubble
} | bubble
