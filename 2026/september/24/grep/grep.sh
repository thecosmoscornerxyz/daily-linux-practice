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

figlet "Grep"
line
{
	{
		blue "Case-Insensitve Search"
		grep -i "BOOGERS" boogers.md
	} | bubble 
	line
	{
		blue "exclude Matching Search"
		grep -v "boogers" boogers.md
	} | bubble
	line
	{
		blue "Show Matching Line Numbers"
		grep -n "shit" boogers.md
	} | bubble
	line
	{
		blue "Count Matching Lines"
		grep -c "boogers" boogers.md
	} | bubble
	line
	{
		blue "Search Multiple Patterns"
		grep -E "boogers|sherlock" boogers.md
	} | bubble
} | bubble
