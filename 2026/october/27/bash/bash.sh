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

figlet "Bash"
line
{
	{
		blue "For Loop"
		line
		{
			for item in apple banana cherry; do
				echo "$item"
			done
		} | bubble
	} | bubble
	line
	{
		blue "C Style FOR Loop"
		line
		{
			for ((i=1; i<=5; i++)); do
				echo "$i"
			done
		} | bubble
	} | bubble
	line
	{
		blue "While Loop"
		line
		{
			count=1
			while [[ $count -le 5]]; do
				echo "$count"
				((count++))
			done
		} | bubble
	} | bubble
	line
	{
		blue "Until Loop"
		line
		{
			count=1
			until [[ $count -gt 5 ]]; do
				echo "$count"
				((count++))
			done
		} | bubble
	} | bubble
} | bubble
