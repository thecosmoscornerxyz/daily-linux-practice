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
		blue "Print 1st Field"
		line
		{
			cut -d " " -f1 boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Print Multiple Fields"
		line
		{
			cut -d " " -f1,3 boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Print Multiple Range"
		line
		{
			cut -c1-5 boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Extract Username and Shell"
		line
		{
			cut -d: -f1,7 /etc/passwd
		} | bubble
	} | bubble
} | bubble
