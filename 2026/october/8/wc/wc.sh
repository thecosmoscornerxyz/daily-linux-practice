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
		cat booger.md
	} | bubble
	line
	{
		blue "Show Line, Word, and Byte Counts"
		line
		wc boogers.md
	} | bubble
	line
	{
		blue "Show Line"
		line
		wc -l boogers.md
	} | bubble
	line
	{
		blue "Show Words"
		line
		wc -w boogers.md
	} | bubble
	line
	{
		blue "Bytes"
		line
		wc -c boogers.md
	} | bubble
} | bubble
