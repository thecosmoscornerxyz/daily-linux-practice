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

figlet TR
line
{
	echo "boogers boogers2 boogers3" >> boogers.md
	echo "no shit sherlock" >> boogers.md
	blue "Boogers" 
	cat boogers.md
	line
	blue "Convert Lowercase to Uppsercase" | bubble
	echo "boogers are cool" | tr "a-z" "A-Z"
	line
	blue "Delete Numbers" | bubble
	echo "boogers123" | tr -d "0-9"
} | bubble
