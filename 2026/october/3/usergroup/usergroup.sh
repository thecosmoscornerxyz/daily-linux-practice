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
		blue "groups"
		id tempuser01
	} | bubble
	line
	{
		blue "passwd entry:"
		grep tempuser01 /etc/passwd
		line
		blue "shadow entry(hashed)"
		sudo grep tempuser01 /etc/shadow
	} | bubble
	line
	{
		blue "tempuser01 deleted"
		sudo userdel -r tempuser01
		{
			if grep tempuser01 /etc/passwd; then
				echo "tempuser01 still here"
			else:
				echo "tempuser01 gone"
			fi
		} | bubble
	} | bubble
} | bubble
