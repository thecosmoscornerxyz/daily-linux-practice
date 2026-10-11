#!/usr/bin/env bash

bubble () {
	gum style --border rounded
}

line () {
	printf '%*s' 50 '' | tr ' ' '-'
	echo
}

figlet "Hash"
line
{
	sha256sum boogers.md
} | bubble
