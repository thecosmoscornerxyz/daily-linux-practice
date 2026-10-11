#!/usr/bin/env bash

line () {
	printf '%*s' 50 '' | tr ' ' '-'
	echo
}

bubble () {
	gum style --border rounded
}

figlet "Rsync"
line
{
	rsync -av dir1/ dir2/
} | bubble
