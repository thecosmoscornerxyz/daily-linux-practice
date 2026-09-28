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

figlet "WC"
line
{
	{
		blue "Boogers"
		cat boogers.md
	} | bubble
	line
	{
		blue "Show Line, Word, Byte Counts"
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
