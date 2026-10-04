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
	sudo useradd -m tempuser01 2> /dev/null
	sudo groupadd -f tempgroup 2> /dev/null
	sudo usermod -aG tempgroup tempuser01 2> /dev/null
	{
		blue "Tempuser01 Created"
		grep tempuser01 /etc/passwd 2> /dev/null
		line
		blue "Groups"
		id tempuser01
	} | bubble
	{
		blue "Passwd Entry:"
		grep tempuser01 /etc/passwd 2> /dev/null
		line
		blue "Shadow Entry(hashed)"
		sudo grep tempuser01 /etc/shadow 2> /dev/null
	} | bubble
	line
	{
		blue "Tempuser01 Deleted"
		sudo userdel -r tempuser01
		{
			if grep tempuser01 /etc/passwd; then
				echo "tempuser01 still here"
			else:
				echo "tempuser01 deleted"
			fi
		} | bubble
	} | bubble
} | bubble
