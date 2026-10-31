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
	read -rp "What package do you want to install? " package

	echo "You chose: $package"
} | bubble
