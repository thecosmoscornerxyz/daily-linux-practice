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
		for name in cosmos friday waffles; do
			echo "$name"
		done
	} | bubble
	line
	{
		blue "For Statements"
		line
		{
			for ((i=1, i<=3; i++)); do
				echo "$i"
			done
		} | bubble
	} | bubble
	line
	{
		blue "While Statement"
		line
		{
			count =1

			while [[ $count -le 3 ]]; do
				echo "$count"
				((count++))
			done
		} | bubble
	} | bubble
	line
	{
		blue "While Read"
		line
		{
			while read -r line; do
				echo "$line"
			done < names.text
		} | bubble
	} | bubble
} | bubble
