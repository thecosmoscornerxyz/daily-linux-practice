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
		blue "Print Character Ranger"
		line
		cut -c1-5 boogers.md
	} | bubble
	line
	{
		blue "extract Username and shell"
		line
		cut -d: -f1,7 /etc/passwd
	} | bubble
} | bubble
