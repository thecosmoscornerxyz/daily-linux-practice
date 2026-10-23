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

system_info () {
	echo "User: $(whoami)"
	line
	echo "Uptime: $(uptime -p)"
	line
	echo "Hostname: $(hostname)"
	line
	echo "Today is: $(date)"
}

disk_usage () {
	df -h /
}

ip_address () {
	ip -brief addr
}

ssh_service () {
	systemctl is-active ssh || systemctl status ssh | head -n 10 2>/dev/null
}

while true; do

	figlet "System"
	line

	blue "Choose what you want to inspect"
	echo "1) System Info"
	echo "2) Disk Usage"
	echo "3) IP Address"
	echo "4) SSH Service"
	echo "5) Run Everyhing"
	echo " "
	echo "q) Quit"

	read -rp "> "

	case "$REPLY" in

		1)
			blue "Linux Warmup"
			system_info | bubble
			;;

		2) 
			blue "Disk Usage"
			disk_usage | bubble
			;;

		3)
			blue "IP Address"
			ip_address | bubble
			;;

		4)
			blue "SSH Service"
			ssh_service | bubble
			;;

		5)
			blue "Linux Warmup"
			system_info | bubble
			line

			blue "Disk Usage:"
			disk usage | bubble
			line

			blue "IP Address:"
			ip_address | bubble
			line

			blue  "SSH Service"
			ssh_service | bubble
			line
			;;

		q|Q)
			line
			echo "Later Nerd"
			break
			;;

	esac

	echo 
	read -rp "Press Enter to Continue...."

done
