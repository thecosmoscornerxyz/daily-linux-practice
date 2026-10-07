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
		blue "Case Insensitive Search"
		line
		grep -i "BOOGERS" boogers.md
	} | bubble
	line
	{
		blue "Exclude Matching Lines"
		line
		grep -v "boogers" boogers.md
	} | bubble
	line
	{
		blue "Show Matching Line Numbers"
		line
		grep -n "shit" boogers.md
	} | bubble
	line
	{
		blue "Count Matching Lines"
		line
		grep -c "boogers" boogers.md
	} | bubble
	line
	{
		blue "Search Multiple Patterns"
		line
		grep -E "boogers|sherlock" boogers.md
	} | bubble
} | bubble
