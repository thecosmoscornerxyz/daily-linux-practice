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
		blue "sort aplhabetically"
		line
		{
			sort boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Sort in Reverse order"
		line
		{
			sort -r boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Sort Numerically by 2nd Field"
		line
		{
			sort -k2 -n boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Sort Numerically by 2nd Field"
		line
		{
			sort -k2 -nr boogers.md
		} | bubble
	} | bubble
} | bubble
