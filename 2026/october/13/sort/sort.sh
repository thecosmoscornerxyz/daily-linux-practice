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

figlet "Sort"
line
{
	{
		blue "Sort Alpbateically"
		line
		{
			sort boogers.md 2>/dev/null
		} | bubble
	} | bubble
	line
	{
		blue "Sort in Reverse Order"
		line
		{
			sort -r boogers.md 2>/dev/null
		} | bubble
	} | bubble
	line
	{
		blue "Sort Numerically by 2nd Field"
		line
		{
			sort -k2 -n boogers.md 2>/dev/null
		} | bubble
	} | bubble
	line
	{
		blue "Sort Numerically by 2nd Field (Descending)"
		line
		{
			sort -k2 -nr boogers.md 2>/dev/null
		} | bubble
	} | bubble
} | bubble
