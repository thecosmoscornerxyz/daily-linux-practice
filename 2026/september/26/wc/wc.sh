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
		blue "Show Line, Words and Byte Counts"
		wc boogers.md
	} | bubble
	line
	{
		blue "Show Lines"
		wc -l boogers.md
	} | bubble
	line
	{
		blue "Show Words"
		wc -w boogers.md
	} | bubble
	line
	{
		blue "Show Bytes"
		wc -c boogers.md
	} | bubble
} | bubble
