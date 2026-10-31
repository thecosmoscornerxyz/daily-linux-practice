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
		blue "show line, word, and byte counts"
		line
		{
			wc boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "line"
		line
		{
			wc -l boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "word"
		line
		{
			wc -w boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "bytes"
		line
		{
			wc -c boogers.md
		} | bubble
	} | bubble
} | bubble
