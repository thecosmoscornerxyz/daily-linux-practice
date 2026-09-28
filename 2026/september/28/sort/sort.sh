#!/usr/bin/env bash

line () {
	printf '%*s' 50 '' | tr ' ' '-'
	echo
}

bubble () {
	gum style --border rounded
}

blue () {
	gum style --border rounded
}

figlet "Sort"
line
{
	{
		blue "Sort Alphabetically"
		sort boogers.md
	} | bubble
	line
	{
		blue "Sort In Reverse Order"
		sort -r boogers.md
	} | bubble
	line
	{
		blue "Sort Numerically by Second Field"
		sort -k2 -n boogers.md
	} | bubble
	line
	{
		blue "Sort Numerically by Second Field (Descending)"
		sort -k2 -nr boogers.md
	} | bubble
} | bubble
