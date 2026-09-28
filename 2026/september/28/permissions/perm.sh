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
	rm -f file1 file2
	touch file1 file2
	{
		ls -la | grep file
	} | bubble
	line
	{
		blue "Before"
		ls -l
	} | bubble
	line
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
		blue "File1 should be rw-------"
		blue "File2 should be rwxr-xr--"
	} | bubble
} | bubble
