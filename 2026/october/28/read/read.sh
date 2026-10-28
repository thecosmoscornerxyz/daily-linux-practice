#!/usr/bin/env bash

line () {
	printf '%*s' 50 '' | tr ' ' '-'
	echo
}

bubble () {
	gum style --border rounded
}

figlet "Read"
line
{
	read -rp "What Package do you want to Install " package

	echo "You chose: $package"
} | bubble
