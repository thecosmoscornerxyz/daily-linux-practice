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
		cat boogers.md
	} | bubble
	line
	{
		blue "Show Line, Word, and Byte Counts"
		wc boogers.md
	} | bubble
	line
	{
		blue "Count Lines"
		wc -l boogers.md
	} | bubble
	line
	{
		blue "Count Words"
		wc -w boogers.md
	} | bubble
	line
	{
		blue "Count Bytes"
		wc -c boogers.md
	} | bubble
} | bubble
