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
		cat boogers.md
	} | bubble
	line
	{
		blue "Remove Adjacent Duplicate Lines"
		uniq boogers.md
	} | bubble
	line
	{
		blue "Cont Duplicate Occurences"
		uniq -c boogers.md
	} | bubble
	line
	{
		blue "Show Only Duplicate Lines"
		uniq -d boogers.md
	} | bubble
	line
	{
		blue "Show Only Unique Lines"
		uniq -u boogers.md
	} | bubble
} | bubble
