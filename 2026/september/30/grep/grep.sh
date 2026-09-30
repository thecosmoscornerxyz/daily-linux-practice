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

figlet "Grep"
line
{
	{
		blue "Case-Insensitive Search"
		grep -i "BOOGERS" boogers.md
	} | bubble
	line
	{
		blue "Exclude Matching Lines"
		grep -v "boogers" boogers.md
	} | bubble
	line
	{
		blue "Show Matching Line Numbers"
		grep -n "shit" boogers.md
	} | bubble
	line
	{
		blue "Count matching Lines"
		grep -c "boogers" boogers.md
	} | bubble
	line
	{
		blue "Search Multiple Patterns"
		grep -E "boogers|sherlock" boogers.md
	} | bubble
} | bubble
