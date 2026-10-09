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

figlet "Hash Practice"
line
{
	blue "Generate SHA-256 Sum"
	line
	sha256sum boogers.md
} | bubble
