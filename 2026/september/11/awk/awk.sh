#!/usr/bin/env bash

echo "boogers boogers2 boogers3" | tee boogers.md
echo "no shit sherlock" >> boogers.mid

figlet awk
echo

{
	awk '{print $1}' boogers.md
	echo
	printf '%*s\n' 50 '' | tr ' ' '-'
	awk '/no/' boogers.md
	echo
	awk '{print NR, $0}' boogers.md
	echo
	awk 'NR == 2 {print $0}' boogers.md
	echo
	awk '{print NF}' boogers.md
	echo
	awk '{print $NF}' boogers.md
	echo
	awk -F: '{print $1, $3, $7}' /etc/passwd
	echo
	awk 'END {print "Total Lines:", NR}' boogers.md
} | gum style \
	--border rounded \
	--padding "1 2" \
	--margin "1"
