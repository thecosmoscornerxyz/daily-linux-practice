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

	blue "Tempuser01 Created" | bubble
	grep tempuser01 /etc/passwd
	blue "Groups" | bubble
	line
	blue "Passwd Entry:" | bubble
	grep tempuser01 /etc/passwd
	blue "shadow entry(hashed)" | bubble
	sudo grep tempuser01 /etc/shadow
	line
	blue "Tempuser01 Deleted" | bubble
	sudo userdel -r tempuser01
	if grep -q tempuser01 /etc/passwd; then
		echo "He's Still Here Bro"
	else:
		echo "He Gone Bro"
	fi
} | bubble
