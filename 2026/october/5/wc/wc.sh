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
	line
	{
		blue "Show Line, Word and Byte Counts"
		line
		wc boogers.md
	} | bubble
	line
	{
		blue "Lines"
		line
		wc -l boogers.md
	} | bubble
	line
	{
		blue "Word"
		line
		wc -w boogers.md
	} | bubble
	line
	{
		blue "bytes"
		line
		wc -c boogers.md
	} | bubble
} | bubble
