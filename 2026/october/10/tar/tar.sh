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

figlet "Tar"
line
{
	{
		blue "Before Dirs:"
		ls
		mkdir testdir
	} | bubble
	line
	{
		blue "Create Archive"
		line
		tar -czf backup.tar.gz testdir/
	} | bubble
	line
	{
		blue "Inspect File"
		line
		tar -tzf backup.tar.gz
	} | bubble
	line
	{
		blue "Extract Archive"
		line
		tar -xzf backup.tar.gz
	} | bubble
} | bubble
