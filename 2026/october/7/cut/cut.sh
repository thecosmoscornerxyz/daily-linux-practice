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

figlet "Cut"
line
{
	{
		blue "Boogers"
		line
		cat boogers.md
	} | bubble
	line
	{
		blue "Print 1st Field"
		line
		cut -d " " -f1 boogers.md
	} | bubble
	line
	{
		blue "Print Multiple Fields"
		line
		cut -d " " -f1,3 boogers.md
	} | bubble
	line
	{
		blue "Print Character Range"
		line
		cut -c1-5 boogers.md
	} | bubble
	line
	{
		blue "Extract Username and Shell"
		line
		cut -d: -f1,7 /etc/passwd
	} | bubble
} | bubble
