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

figlet Find
line
{
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
	bubble
} | bubble
