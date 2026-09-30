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
	echo "Boogers are cool" >> boogers.md
	echo "boogers123" >> boogers.md
	{
		blue "convert lowercase to uppercase"
		tr "a-z" boogers.md
	} | bubble
	line
	{
		blue "Delete Numbers"
		tr -d "0-9" boogers.md
	} | bubble
} | bubble
