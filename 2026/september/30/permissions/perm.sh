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
		rm -f -v file1 file2 2> /dev/null
	} | bubble
	line
	{
		blue "before"
		ls -l
	} | bubble
	line
	chmod 600 file1 2> /dev/null
	chmod 754 file2 2> /dev/null
	chown root:root file1 2> /dev/null
	sudo chown "$USER":"$USER" 2> /dev/null
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
