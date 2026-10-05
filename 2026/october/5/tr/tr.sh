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
		blue "Conver Lowercase to Uppercase"
		line
		echo "boogers are cool" | tr "a-z" "A-Z"
	} | bubble
	line
	{
		blue "Delete Numbers"
		line
		echo "boogers123" | tr -d "0-9"
	} | bubble
} | bubble
