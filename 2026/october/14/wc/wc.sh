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
		line
		{
			cat boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Show Line, Word, and Byte Counts"
		line
		{
			wc boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Lines"
		line
		{
			wc -l boogers
		} | bubble
	} | bubble
	line
	{
		blue "Words"
		line
		{
			wc -w boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Bytes"
		line
		{
			wc -c boogers.md
		} | bubble
	} | bubble
} | bubble
