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
		blue "Show Line, Word, and Byte Counts"
		line
		{
			wc boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Count Lines"
		line
		{
			wc -l boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Count Words"
		line
		{
			wc -w boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Count Bytes"
		line
		{
			wc -c boogers.md
		} | bubble
	} | bubble
} | bubble
