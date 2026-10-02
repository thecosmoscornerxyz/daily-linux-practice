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
		blue "Convert Lowercase to Uppercase"
		echo "boogers123" | tr "a-z" "A-Z"
	} | bubble
	line
	{
		blue "Delete Numbers"
		echo "boogers123" | tr -d "0-9"
	} | bubble
} | bubble
