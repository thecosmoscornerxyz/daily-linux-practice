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
		blue "boogers"
		cat boogers.md
	} | bubble
	line
	{
		blue "Show Line, Word, Byte Count"
		wc boogers.md
	} | bubble
	line
	{
		blue "Show Line Count"
		wc -l boogers.md
	} | bubble
	line
	{
		blue "Show Word Count"
		wc -w boogers.md
	} | bubble
	line
	{
		blue "Show Byte Count"
		wc -c boogers.md
	} | bubble
} | bubble
