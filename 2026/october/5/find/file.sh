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

figlet "File"
line
{
	echo "boogers" >> boogers.md
	{
		blue "Find Markdown Files"
		line
		find . -name "*.md"
	} | bubble
	line
	{
		blue "Find All Files"
		line
		find . -type f
	} | bubble
	line
	{
		blue "Find All Directories"
		line
		find . -type d
	} | bubble
	line
	{
		blue "Find Files Larger Than 1MB"
		line
		find . -type f -size +1M
	} | bubble
	line
	{
		blue "Find Files Modified in the last 7 days"
		line
		find . -type f -mtime -7
	} | bubble
} | bubble
