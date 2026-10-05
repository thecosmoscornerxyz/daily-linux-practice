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
	sleep 600 & 2>/dev/null
	{
		echo $! 2>/dev/null
	} | bubble
	line
	{
		ps aux | grep sleep 2>/dev/null
	} | bubble
	kill $!
} | bubble
