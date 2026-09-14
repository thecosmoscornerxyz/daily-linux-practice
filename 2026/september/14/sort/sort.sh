#!/usr/bin/env bash

blue () {
	gum style --foreground 39 "$@"
}

bubble () {
	gum style --border rounded
}

line () {
	printf '%*s' 50 '' | tr ' ' '-'
	echo
}

figlet Sort
line
{
	blue "Boogers" | bubble
	cat boogers.md
	blue "sort alphabetically" | bubble
	sort boogers.md
	line
	blue "Sort in Reverse Order" | bubble
	sort -r boogers.md
	line
	blue "Sort Numerically by Second Field" | bubble
	sort -k2 -n boogers.md
	line
	blue "Sort Numerically by 2nd Field (Descending)" | bubble
	sort -k2 -nr boogers.md
} | bubble
