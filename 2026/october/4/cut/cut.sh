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
		line
		cut -d " " -f1 boogers.md 2> /dev/null
	} | bubble
	line
	{
		blue "Print Multiple Fields"
		line
		cut -d " " -f1,3 boogers.md 2> /dev/null
	} | bubble
	line
	{
		blue "Print Character Range"
		line
		cut -c1-5 boogers.md 2> /dev/null
	} | bubble
	line
	{
		blue "Extract Username and Shell"
		line
		cut -d: -1,7 /etc/passwd 2> /dev/null
	} | bubble
} | bubble
