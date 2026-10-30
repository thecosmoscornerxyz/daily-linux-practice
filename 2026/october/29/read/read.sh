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

figlet "Read"
line
{
	{
		blue "Input"
		line
		{
			read -rp "What package do you want to install? " package
		} | bubble
	} | bubble
	line
	{
		blue "Choice"
		line
		{
			echo "You chose: $package"
		} | bubble
	} | bubble
} | bubble
