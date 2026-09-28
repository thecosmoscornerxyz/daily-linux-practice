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

figlet "Find"
line
{
	echo "boogers.md" >> boogers.md
	{
		blue "Boogers"
		cat boogers.md
	} | bubble
	line
	{
		blue "Find Markdown Files"
		find . -name "*.md"
	} | bubble
	line
	{
		blue "Find All Files"
		find . -type f
	} | bubble
	line
	{
		blue "Find All Directories"
		find . -type d
	} | bubble
	line
	{
		blue "Find Files Larger Than 1 MB"
		find . -type f -size +1M
	} | bubble
	line
	{
		blue "Find Files Modified in the Last 7 Days"
		find . -type f -mtime -7
	} | bubble
} | bubble
