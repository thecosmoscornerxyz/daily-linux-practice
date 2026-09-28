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

figlet "TR" 
line
{
	{
		echo "boogers are cool" >> boogers.md
		echo "boogers123" >> boogers.md
		blue "boogers"
		cat boogers.md
	} | bubble
	line
	{
		blue "Convert Lowercase to Uppercase"
		tr "a-z" "A-Z" boogers.md
	} | bubble
	line
	{
		blue "Delete Numbers"
		tr -d "0-9" boogers.md
	} | bubble
} | bubble
