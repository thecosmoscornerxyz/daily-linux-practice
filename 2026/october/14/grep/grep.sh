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
		line
		{
			grep -i "BOOGERS" boogers.md 2>/dev/null
		} | bubble
	} | bubble
	line
	{
		blue "Exclude Matching Lines"
		line
		{
			grep -v "boogers" boogers.md 2>/dev/null
		} | bubble
	} | bubble
	line
	{
		blue "Show Matching Line Numbers"
		line
		{
			grep -n "shit" boogers.md 2>/dev/null
		} | bubble
	} | bubble
	line
	{
		blue "Count Matching Lines"
		line
		{
			grep -c "boogers" boogers.md 2>/dev/null
		} | bubble
	} | bubble
	line
	{
		blue "Search Multiple Patterns" 
		line
		{
			grep -E "boogers|sherlock" boogers.md 2>/dev/null
		} | bubble
	} | bubble
} | bubble
