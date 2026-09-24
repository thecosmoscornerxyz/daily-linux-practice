#!/usr/bin/env bash

line () {
	printf '%*s' 50 '' | tr ' ' '-d'
	echo
}

blue () {
	gum style --foreground 39 "$@"
}

bubble () {
	gum style --border rounded
}

figlet TR
line
{
	blue "Convert Lowercase to Uppercase" | bubble
	echo "boogers are cool" | tr "a-z" "A-Z"
	line
	blue "Delete Numbers" | bubble
	echo "boogers123" | tr -d "0-9"
} | bubble
