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

figlet Uniq
line
{
	blue "Boogers" | bubble
	cat boogers.md
	line
	blue "Remove Adjacent Duplicate Lines" | bubble
	uniq boogers.md
	line
	blue "Count Duplicate Occurences" | bubble
	uniq -c boogers.md
	line
	blue "Show Only Duplicate Lines" | bubble
	uniq -d boogers.md
	line
	blue "Show Only Unique Lines" | bubble
	uniq -u boogers.md
} | bubble
