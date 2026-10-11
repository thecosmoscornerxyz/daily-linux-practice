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

figlet "Sed"
line
{
	{
		blue "Boogers"
		line
		cat boogers.md
	} | bubble
	line
	{
		blue "Print First Line"
		line
		sed -n "1p" boogers.md 2>/dev/null
	} | bubble
	line
	{
		blue "Print 1st 2 Lines"
		line
		sed -n "1,2p" boogers.md 2>/dev/null
	} | bubble
	line
	{
		blue "Replace Text"
		line
		sed "s/boogers/shit/" boogers.md 2>/dev/null
	} | bubble
	line
	{
		blue "Delete Matching Line"
		line
		sed "/sherlock/d" boogers.md 2>/dev/null
	} | bubble
} | bubble
