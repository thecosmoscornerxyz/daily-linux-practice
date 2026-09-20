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

blue "Grep"
line
{
	blue "Case-Insensitive Search" | bubble
	grep -i "BOOGERS" boogers.md
	line
	blue "Exclude Matching Lines" | bubble
	grep -v "boogers" boogers.md
	line
	blue "Show Matching Line Numbers" | bubble
	grep -n "shit" boogers.md
	line
	blue "Count Matching Lines" | bubble
	grep -c "boogers" boogers.md
	line
	blue "Search Multiple Patterns" | bubble
	grep -E "boogers|sherlock" boogers.md
} | bubble
