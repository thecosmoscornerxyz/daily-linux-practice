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
	sudo useradd -m tempuser01
	sudo groupadd -f tempgroup
	sudo usermod -aG tempgroup tempuser01
	{
		blue "Tempuser01 Created"
		grep tempuser01 /etc/passwd
		line
		blue "Groups for Tempuser01"
		id tempuser01
	} | bubble
	{
		blue "Passwd Entry"
		grep tempuser01 /etc/passwd
		blue "shadow entry(hashed)"
		sudo grep tempuser01 /etc/shadow
	} | bubble
	{
		blue "tempuser01 deleted"
		sudo userdel -r tempuser01
		{
			if grep tempuser01 /etc/passwd; then
				echo "tempuser01 still here bro"
			else:
				echo "tempuser01 gone"
			fi
		} | bubble
	} | bubble
} | bubble
