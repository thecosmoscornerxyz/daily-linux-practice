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

figlet "Sed"
line
{
	{
		blue "Print First Line"
		line
		sed -n "1p" boogers.md
	} | bubble
	line
	{
		blue "Print 1st 2 Lines"
		line
		sed -n "1,2p" boogers.md
	} | bubble
	line
	{
		blue "Replace Text"
		line
		sed "s/boogers/shit" boogers.md
	} | bubble
	line
	{
		blue "Delete Matching Lines"
		line
		sed "/sherlock/d" boogers.md
	} | bubble
} | bubble
