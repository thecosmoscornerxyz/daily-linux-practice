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

figlet Usergroup
line
{
	sudo useradd -m tempuser01
	sudo groupadd -f tempgroup
	sudo usermod -aG tempgroup tempuser01

	blue "tempuser01 created" | bubble
	grep tempuser01 /etc/passwd
	blue "groups for tempuser01" | bubble
	id tempuser01
	line
	blue "passwd entry:" | bubble
	grep tempuser01 /etc/passwd
	blue "shadow entry(hashed)" | bubble
	sudo grep tempuser01 /etc/shadow
	line
	blue "tempuser01 deleted" | bubble
	sudo userdel -r tempuser01
	grep tempuser01 /etc/passwd
} | bubble
