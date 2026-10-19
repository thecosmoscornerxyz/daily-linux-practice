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
	echo "Hostname: $(hostname)"
	line
	echo "Today is: $(date)"
	line
	echo "Uptime: $(uptime -p)"
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
	figlet "Linux Warmup"
	line
	{
		blue "Choose What You'd Like to Inspect:"
		echo "1) System Info"
		echo "2) Disk Usage"
		echo "3) IP Address"
		echo "4) SSH Service"
		echo "5) Run Everything"
		echo "q) Quit"

		read -rq "> "

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

				blue "Disk Usage"
				disk_usage | bubble
				line

				blue "IP Address"
				ip_address | bubble
				line

				blue "SSH Service"
				ssh_service | bubble
				;;

			q|Q)
				echo "Later Nerd"
				break
				;;

			*)
				echo "Invalid Option"
				;;

			esac

			echo
			read -rq "Press Enter to continue..."	
	} | bubble

done
