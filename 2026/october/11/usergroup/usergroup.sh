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

figlet "Usergroup"
line
{
	sudo useradd -m tempuser01 2>/dev/null
	sudo groupadd -f tempgroup 2>/dev/null
	sudo usermod -aG tempgroup tempuser01 2>/dev/null
	{
		blue "tempuser01 created"
		line
		grep tempuser01 /etc/passwd 2>/dev/null
	} | bubble
	line
	{
		blue "Groups"
		line
		id tempuser01 2>/dev/null
	} | bubble
	line
	{
		blue "Passwd Entry:"
		line
		grep tempuser01 /etc/passwd 2>/dev/null
	} | bubble
	line
	{
		blue "Shadow Entry(hashed)"
		line
		sudo grep tempuser01 /etc/shadow 2>/dev/null
	} | bubble
	line
	{
		blue "Is Tempuser01 Gone?"
		sudo userdel -r tempuser01 2>/dev/null
		line
		{
			if grep 'tempuser01' /etc/passwd; then
				blue "No"
			else
				blue "Yes"
			fi
		} | bubble
	} | bubble
} | bubble
