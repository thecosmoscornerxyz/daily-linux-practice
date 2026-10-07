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
		grep tempuser01 /etc/passwd 2>/dev/null
		line
		blue "groups"
		id tempuser01 2>/dev/null
	} | bubble
	line
	{
		blue "Passwd Entry:"
		grep tempuser01 /ect/passwd 2>/dev/null
		line
		blue "shadow entry(hashed)"
		sudo grep tempuser01 /etc/shadow
	} | bubble
	line
	{
		blue "Tempuser01 Deleted"
		sudo userdel -r tempuser01 2>/dev/null
		{
			if grep tempuser01 /etc/passwd; then
				echo "tempuser01 not deleted"
			else:
				echo "tempuser01 deleted"
			fi
		} | bubble	
	} | bubble
} | bubble
