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

figlet "Process"
line
{
	sleep 600 &
	echo $! | bubble
	ps aux | grep sleep | bubble
	kill $!
} | bubble
