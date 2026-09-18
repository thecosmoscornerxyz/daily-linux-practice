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
	blue "print first field" | bubble
	cut -d" " -f1 boogers.md
	line
	blue "Print Multiple Fields" | bubble
	cut -d" " -f1,3 boogers.md
	line
	blue "Print Character Range" | bubble
	cut -c1-5 boogers.md
	line
	blue "Extract Username and Shell" | bubble
	cut -d: -f1,7 /etc/passwd
} | bubble
