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

figlet Sort
line
{
	blue "Sort Alphabetically" | bubble
	sort boogers.md
	line
	blue "Sort in Reverse Order" | bubble
	sort -r boogers.md
	line
	blue "Sort Numerically by Second Field" | bubble
	sort -k2 -n boogers.md
	line
	blue "Sort Numerically by Second Field (Descending)" | bubble
	sort -k2 -nr boogers.md
} | bubble
