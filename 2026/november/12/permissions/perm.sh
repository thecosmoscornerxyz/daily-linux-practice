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
	chmod 600 file1
	chmod 754 file2
	chmod root:root file1
	sudo chown "$USER":"$USER" file2
	{
		blue "After"
		line
		{
			ls -l
		} | bubble
	} | bubble
	line
	{
		blue "Permissions"
		line
		{
			echo "file1 should be rw-------"
		} | bubble
		line
		{
			echo "file2 should be rwxr-xr--"
		} | bubble
	} | bubble
} | bubble
