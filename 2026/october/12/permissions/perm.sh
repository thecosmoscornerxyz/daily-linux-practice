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
		touch file1 file2
	} | bubble
	line
	{
		blue "Before"
		line
		{
			ls -l
		} | bubble
	} | bubble
	line
	chmod 600 file1 2>/dev/null
	chmod 754 file2 2>/dev/null
	chown root:root file1 2>/dev/null
	sudo chown "$USER":"$USER" file2 2>/dev/null
	{
		blue "After"
		line
		{
			ls -l
		} | bubble
	} | bubble
	line
	{
		blue "File1 should be rw-------"
		line
		blue "File2 should be rwxr-xr--"
	} | bubble
} | bubble
