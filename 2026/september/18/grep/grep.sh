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
	blue "Boogers" | bubble
	cat boogers.md
	line
	blue "Case Insensitive Search" | bubble
	grep -i "BOOGERS" boogers.md
	line
	blue "Exclude Matching Lines" | bubble
	grep -v "boogers" boogers.md
	line
	blue "Show Matching Line Numbers" | bubble
	grep -n "shit boogers.md" boogers.md
	line
	blue "Count Matching LInes" | bubble
	grep -c "boogers" boogers.md
	line
	blue "Search Multiple Patterns" | bubble
	grep -E "boogers|sherlock" boogers.com
} | bubble
