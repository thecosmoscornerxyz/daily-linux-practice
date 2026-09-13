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

figlet PERMISSIONS
line
{
	rm -f file1 file2
	touch file1 file2

	blue "before" | bubble
	ls -l
	line
	chmod 600 file1
	chmod 754 file2
	chown root:root file1
	chown "$USER":"$USER" file2
	blue "after" | bubble
	ls -l
	line
	blue "file1 should be rw-------"
	blue "file2 should be rwxr-xr--"
} | bubble
