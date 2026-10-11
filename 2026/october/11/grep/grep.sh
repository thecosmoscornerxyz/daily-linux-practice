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
		blue "Boogers"
		line
		cat boogers.md
	} | bubble
	line
	{
		blue "Case-Insensitive Search"
		line
		grep -i "BOOGERS" boogers.md 2>/dev/null
	} | bubble
	line
	{
		blue "Exclude Matching Lines"
		line
		grep -v "boogers" boogers.md 2>/dev/null
	} | bubble
	line
	{
		blue "Show Matching Line Numbers"
		line
		grep -n "shit" boogers.md 2>/dev/null
	} | bubble
	line
	{
		blue "Count Matching Lines"
		line
		grep -c "boogers" boogers.md 2>/dev/null
	} | bubble
	line
	{
		blue "Search Multiple Patterns"
		line
		grep -E "boogers|sherlock" boogers.md 2>/dev/null
	} | bubble
} | bubble
