#!/usr/bin/env bash

bubble() {
    gum style --border rounded
}

blue() {
	gum style --foreground 39 "$@"
}

line() {
	printf '%*s' 50 '' | tr ' ' '-'
	echo
}

sudo useradd -m tempuser01 2> /dev/null
sudo groupadd -f tempgroup 2> /dev/null
sudo usermod -aG tempgroup tempuser01 2> /dev/null

figlet Usergroup
line
{
	blue "tempuser01 created:"
	grep tempuser01 /etc/passwd | bubble
	blue "groups"
	id tempuser01 | bubble
	echo
	line
	blue  "passwd entry:"
	grep tempuser01 /etc/passwd | bubble
	blue "shadow entry(hashed):"
	sudo grep tempuser01 /etc/shadow | bubble
	echo
	line
	blue "removing tempuser01"
	sudo userdel -r tempuser01 2> /dev/null
	if grep tempuser01 /etc/passwd; then
		echo "He's still here gang" | bubble
	else
		echo "Tempuser01 Deleted" | bubble
	fi
} | bubble
