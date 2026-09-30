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

figlet "Cut"
line
{
	{
		blue "Print First Field"
		cut -d " " -f1 boogers.md
	} | bubble
	line
	{
		blue "Print Multiple Fields"
		cut -d " " -f1,3 boogers.md
	} | bubble
	line
	{
		blue "Print Character Range"
		cut -c1-5 boogers.md
	} | bubble
	line
	{
		blue "Extract Username and Shell"
		cut -d: -f1,7 /etc/passwd
	} | bubble
} | bubble
