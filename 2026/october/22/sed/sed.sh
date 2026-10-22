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
		blue "Print 1st Field"
		line
		{
			sed -n "1p" boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Print 1st 2 Fields"
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
			sed "s/boogers/shit/" boogers.md
		} | bubble
	} | bubble
	line
	{
		blue "Delete Matching Lines"
		line
		{
			sed "/sherlock/d" boogers.md
		} | bubble
	} | bubble
} | bubble
