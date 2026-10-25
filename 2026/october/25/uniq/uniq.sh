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

figlet "uniq" 
line
{
	{
		blue "Remove Adjacent Duplicate Lines"
		line
		{
			uniq boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Count Duplicate Occurences"
		line
		{
			uniq -c boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Show Only Duplicate Lines"
		line
		{
			uniq -d boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Show Only Unique Lines"
		line
		{
			uniq -u boogers.md
		} | bubble
	} | bubble
} | bubble
