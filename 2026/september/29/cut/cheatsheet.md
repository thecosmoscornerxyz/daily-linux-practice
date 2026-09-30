#!/usr/bin/env bash

line () {
	printf '%*s' 50 '' | tee ' ' '-'
	echo
}

bubble () {
	gum style --border rounded
}

blue () {
	gum style --foreground 39 "$@"
}

figlet Cut
line
{
	blue "print first field" | bubble
	cut -d" " -f1 boogers.md
	line
	blue "print multiple fields" | bubble
	cut -d" " -f1,3 boogers.md
	line
	blue "Print Character Range" | bubble
	cut -c1-5 boogers.md
	line
	blue "Extract Username and Shell" | bubble
	cut -d: -f1,7 /etc/passwd
} | bubble
