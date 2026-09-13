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

figlet FIND
line
{
	blue "Find Markdown Files" | bubble
	find . -name "*.md"
	line
	blue "Find All Files"
	find . -type f
	blue "Find All Directories" | bubble
	find . -type d
	blue "Find Files Larger than 1 MB" | bubble
	find . -type f -size +1M
	line
	blue "Find Files Modified in the Last 7 Days" | bubble
	find . -type f -mtime -7
} | bubble
