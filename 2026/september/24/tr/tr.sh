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
	{
		blue "Convert Lowercase to Uppercase"
		echo "booegrs are cool" | tr "a-z" "A-Z"
	} | bubble
	line
	{
		blue "Delete Numbers"
		echo "boogers123" | tr -d "0-9"
	} | bubble
} | bubble
