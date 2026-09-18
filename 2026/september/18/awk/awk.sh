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

figlet "Awk"
line
{
	echo "boogers boogers2 boogers3" >> boogers.md
	echo "no shit sherlock" >> boogers.md
	blue "boogers" | bubble
	cat boogers.md
	line
	blue "Print 1st Field" | bubble
	awk '{print $1}' boogers.md
	line
	blue "Match a Pattern" | bubble
	awk '/no/' boogers.md
	line
	blue "Print Line Numbers" | bubble
	awk '{print NR, $0}' boogers.md
	line
	blue "Print Specific Line" | bubble
	awk 'NR == 2 {print $0}' boogers.md
	line
	blue "Count Fields" | bubble
	awk '{print NF}' boogers.md
	line
	blue "Print Last Field" | bubble
	awk '{print $NF}' boogers.md
	line
	blue "Custom Field Seperator" | bubble
	awk -F: '{print $1, $3, $7}' /etc/passwd
	line
	blue "Count Total Lines" | bubble
	awk 'END {print "Total Lines:", NR}' boogers.md
} | bubble
