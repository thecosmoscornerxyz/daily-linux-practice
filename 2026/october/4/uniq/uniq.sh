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

figlet "Uniq"
line
{
	{
		blue "Boogers"
		line
		cat boogers.md
	} | bubble
	line
	{
		blue "Remove Adjacent Duplicate Lines"
		line
		uniq boogers.md
	} | bubble
	line
	{
		blue "Count Duplicate Lines"
		line
		uniq -c boogers.md
	} | bubble
	line
	{
		blue "Show only duplicate lines"
		line
		uniq -d boogers.md
	} | bubble
	line
	{
		blue "Show Only Unique Lines"
		line
		uniq -u boogers.md 2> /dev/null
	} | bubble
} | bubble
