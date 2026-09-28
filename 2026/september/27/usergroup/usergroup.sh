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
		blue "tempuser01 created"
		grep tempuser01 /etc/passwd
		line
		blue "Groups"
		id tempuser01
	} | bubble
	line
	{
		blue "passwd entry"
		grep tempuser01 /etc/passwd
		line
		blue "shadow entry(shadow)"
		sudo grep tempuser01 /etc/passwd
	} | bubble
	line
	{
		blue "tempuser01 deleted"
		sudo userdel -r tempuser01 2> /dev/null
		line
		{
			if grep tempuser01 /etc/passwd; then
				echo "tempuser01 still here"
			else:
				echo "tempuser01 gone bro"
			fi
		} | bubble
	} | bubble
} | bubble
