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
	{
		blue "Boogers"
		line
		cat boogers.md
	} | bubble
	line
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
		blue "Find Files Larger than 1MB"
		line
		find . -type f -size +1M
	} | bubble
	line
	{
		blue "Find files modified in the last 7 days"
		line
		find . -type f -mtime -7
	} | bubble
} | bubble
