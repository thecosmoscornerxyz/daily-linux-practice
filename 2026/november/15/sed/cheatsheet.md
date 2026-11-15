#!/usr/bin/env bash

blue () {
	gum style --foreground 39 "$@"
}

line() {
	printf '%*s' 50 '' | tr ' ' '-'
	echo
}

bubble () {
	gum style --border rounded
}

figlet Sed
line
{
	blue "Print First Line" | bubble
	sed -n "1p" boogers.md
	line
	blue "Print First Two Lines" | bubble
	sed -n "1,2p" boogers.md
	line
	blue "Replace Text" | bubble
	sed "s/boogers/shit/" boogers.md
	line
	blue "Delete Matching Line" | bubble
	sed "/sherlock/d" boogers.md
} | bubble
