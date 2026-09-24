#!/usr/bin/env bash

print () {
	printf '%*s' 50 '' | tr ' ' '-'
	echo
}

blue () {
	gum style --foreground 39 "$@"
}

bubble () {
	gum style --border rounded
}

figlet "Perm"
line
{
	rm -f -v file1 file2 | bubble
	touch file1 file2
	{
		blue "before"
		ls -l
	} | bubble
	chmod 600 file1
	chmod 754 file2
	chown root:root file1
	chown "$USER":"$USER" file2
	{
		blue "after"
		ls -l
	} | bubble
	{
		blue "file1 should be rw-------"
		blue "file2 should be rwxr-xr--"
	} | bubble
} | bubble
