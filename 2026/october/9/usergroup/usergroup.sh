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
		blue "Tempuser01 Created"
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
		blue "Tempuser01 Deleted"
		line
		sudo userdel -r tempuser01 2>/dev/null
		if grep 'tempuser01' /etc/passwd; then
			blue "Tempuser01 Not Deleted"
		else
			blue "Tempuser01 Deleted"
		fi
	} | bubble
} | bubble
