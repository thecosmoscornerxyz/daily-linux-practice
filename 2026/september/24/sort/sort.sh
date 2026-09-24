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
		blue "Boogers"
		cat boogers.md
	} | bubble
	line
	{
		blue "Sort Alphabetically"
		sort boogers.md
	} | bubble
	line
	{
		blue "Sort in Reverse Order"
		sort -r boogers.md
	} | bubble
	line
	{
		blue "Sort Numercially by Second Field"
		sort -k2 -n boogers.md
	} | bubble
	line
	{
		blue "Sort Numerically by Second Field (Descending)"
		sort -k2 -nr boogers.md
	} | bubble
} | bubble
