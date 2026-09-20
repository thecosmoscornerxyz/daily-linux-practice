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
	blue "Print First Line" | bubble
	sed -n "1p" boogers.md
	line
	blue "Print First Two Lines" | bubble
	sed -n "1,2p" booges.md
	line
	blue "Replace Text" | bubble
	sed "s/boogers/shit/" boogers.md
	line
	blue "Delete Matching Lines" | bubble
	sed "/sherlock/d" boogers.md
} | bubble
