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

figlet "Uniq"
line
{
	{
		blue "Boogers"
		cat boogers.md
	} | bubble
	line
	{
		blue "Remove Adjacent Duplicate Lines"
		uniq boogers.md
	} | bubble
	line
	{
		blue "Count Duplicate Occurences"
		uniq -c boogers.md
	} | bubble
	line
	{
		blue "Show Only Duplicate Lines"
		uniq -d boogers.md
	} | bubble
	line
	{
		blue "Show Only Uniqe Lines"
		uniq -u boogers.md
	} | bubble
} | bubble
