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

figlet "Usergroup"
line
{
	sudo useradd -m tempuser01 2> /dev/null
	sudo groupadd -f tempgroup 2> /dev/null
	sudo usermod -aG tempgroup tempuser01 2> /dev/null
	{
		blue "tempuser01 created"
		grep tempuser01 /etc/passwd 2>/dev/null
		line
		blue "Groups"
		id tempuser01
	} | bubble
	line
	{
		blue "Passwd Entry"
		grep tempuser01 /etc/passwd 2>/dev/null
		line
		blue "Shadow Entry(hashed)"
		sudo grep tempuser01 /etc/shadow
	} | bubble
	line
	{
		blue "Tempuser01 Deleted"
		sudo userdel -r tempuser01
		line
		{
			if grep tempuser01 /etc/passwd; then
				echo "tempuser01 not deleted"
			else:
				echo "tempuser01 still here"
			fi
		} | bubble
	} | bubble
} | bubble
