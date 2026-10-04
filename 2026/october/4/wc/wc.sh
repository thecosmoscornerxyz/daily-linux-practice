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

figlet "WC"
line
{
	{
		blue "Boogers"
		line
		cat boogers.md
	} | bubble
	{
		blue "Show Line, Word & Byte Counts"
		line
		wc -l boogers.md
	} | bubble
	line
	{
		blue "Show Word"
		line
		wc -w boogers.md
	} | bubble
	line
	{
		blue "Show Counts"
		line
		wc -c boogers.md
	} | bubble
} | bubble
