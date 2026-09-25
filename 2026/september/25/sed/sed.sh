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
		sed -n "1p" boogers.md
	} | bubble
	line
	{
		blue "Print First Two Lines"
		sed -n "1,2p" boogers.md
	} | bubble
	line
	{
		blue "Replace Text"
		sed "s/boogers/shit" boogers.md
	} | bubble
	line
	{
		blue "Delete Matching Line" 
		sed "/sherlock/d" boogers.md
	} | bubble
} | bubble
