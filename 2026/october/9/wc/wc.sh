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

figlet "Wc"
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
		blue "Show Lines"
		line
		wc -l boogers.md
	} | bubble
	line
	{
		blue "Words"
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
