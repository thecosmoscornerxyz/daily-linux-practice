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

figlet WC
line
{
	blue "Boogers" | bubble
	cat boogers.md
	line
	blue "Show Line, Word, and Byte Counts" | bubble
	wc boogers.md
	line
	blue "Count Lines" | bubble
	wc -l boogers.md
	line
	blue "Count Words" | bubble
	wc -w boogers.md
	line
	blue "Count Bytes" | bubble
	wc -c boogers.md
} | bubble
