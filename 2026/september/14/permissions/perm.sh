#!/usr/bin/env bash

line () {
	printf '%*s' 50 '' | tr ' ' '-'
	echo
}

blue () {
	gum style --foreground 50 "$@"
}

bubble () {
	gum style --border rounded
}

figlet Perm
line
{
	rm -f file1 file2
	touch file1 file2

	blue "Before" | bubble
	ls -l
	line
	chmod 600 file1
	chmod 754 file2
	chown root:root file1
	chown "$USER":"$USER" file2
	blue "After" | bubble
	ls -l
	line
	blue "After"
	echo "file1 should be rw-------"
	echo "file2 should be rwxr-xr--"
} | bubble
