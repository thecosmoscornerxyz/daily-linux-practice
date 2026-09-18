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

figlet "Find"
line
{
	echo "boogers boogers2 boogers3" >> boogers.md
	echo "no shit sherlock" >> boogers.md
	blue "boogers" | bubble
	cat boogers.md
	line
	blue "Find Markdown Files" | bubble
	find . -name "*.md"
	line
	blue "Find All Files" | bubble
	find . -type f
	line
	blue "Find All Directories" | bubble
	find . -type d
	line
	blue "Find Files Larger Than 1 MB" | bubble
	find . -type f -size +1M
	line
	blue "Find Files Modified in the Last 7 Days" | bubble
	find . -type f -mtime -7
} | bubble
