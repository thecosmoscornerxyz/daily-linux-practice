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
	{
		blue "Find Markdown Files"
		line
		{
			find . -name "*.md"
		} | bubble
	} | bubble
	line
	{
		blue "Find All Files"
		line
		{
			find . -type f
		} | bubble
	} | bubble
	line
	{
		blue "Find All Directories"
		line
		{
			find . -type d
		} | bubble
	} | bubble
	line
	{
		blue "Find Files Larger Than 1MB"
		line
		{
			find . -type f -size +1M
		} | bubble
	} | bubble
	line
	{
		blue "Find Files Modified in the Last 7 Days"
		line
		{
			find . -type f -mtime -7
		} | bubble
	} | bubble
} | bubble
