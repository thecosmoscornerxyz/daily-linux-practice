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

figlet "TR"
line
{
	echo "boogers are cool" >> boogers.md
	echo "boogers123" >> boogers.md
	{
		blue "Convert Lowercase to Uppercase"
		cat boogers.md | tr "a-z" "A-Z" boogers.md
	} | bubble
	line
	{
		blue "Delete Numbers"
		cat boogers.md | tr "0-9" boogers.md
	} | bubble
} | bubble
