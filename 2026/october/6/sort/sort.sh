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
		blue "sort alphabetically"
		line
		sort boogers.md
	} | bubble
	line
	{
		blue "Sort in Reverse Order"
		line
		sort -r boogers.md
	} | bubble
	line
	{
		blue "Sort Numerically by Second Field"
		line
		sort -kr -n boogers.md
	} | bubble
	line
	{
		blue "Sort Numerically by Second Field(descending)"
		line
		sort -kr -nr boogers.md
	} | bubble
} | bubble
