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

figlet "Process"
line
{
	sleep 600 &
	{
		echo $!
	} | bubble
	line
	{
		ps aux | grep sleep
	} | bubble
	line
	{
		kill $!
	} | bubble
} | bubble
