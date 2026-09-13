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

figlet WC
line
{
	blue "boogers.md" | bubble
	cat boogers.md
	line
	blue "Show Line, Word, and Byte Counts" | bubble
	wc boogers.md
	line
	blue "Count Lines" | bubble
	wc -l boogers.md
	line
	blue "Count Lines" | bubble
	wc -w boogers.md
	line
	blue "Count Bytes" | bubble
	wc -c boogers.md
} | bubble
