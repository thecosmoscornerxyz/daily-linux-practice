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
		blue "Print 1st Field"
		line
		{
			sed -n "1p" boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Print Multiple Fields"
		line
		{
			sed -n "1,2p" boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Replace Text"
		line
		{
			sed "s/boogers/shit" boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Delete Matching Line"
		line
		{
			sed "/sherlock/d" boogers.md
		} | bubble
	} | bubble
} | bubble
