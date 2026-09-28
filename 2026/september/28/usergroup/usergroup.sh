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
		blue "Tempuser01 Created"
		grep tempuser01 /etc/passwd
		line
		blue "Groups"
		id tempuser01
	} | bubble
	line
	{
		blue "Passwd Entry"
		grep tempuser01 /etc/passwd
		line
		blue "Shadow Entry(hashed)"
		sudo grep tempuser01 /etc/shadow
	} | bubble
	{
		blue "Tempuser01 Deleted"
		sudo userdel -r tempuser01
		{
			if grep tempuser01 /etc/passwd; then
				echo "tempuser01 created"
			else:
				echo "tempuser01 deleted"
			fi
		} | bubble
	} | bubble
} | bubble
