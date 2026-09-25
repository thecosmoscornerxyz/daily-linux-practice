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

figlet "AWK"
line
{
	echo "boogers boogers2 boogers3" >> boogers.md
	echo "no shit sherlock" >> boogers.md
	{
		blue "Boogers"
		cat boogers.md
	} | bubble
	line
	{
		blue "Print 1st Feild"
		awk '{print $1}' boogers.md
	} | bubble
	line
	{
		blue "Match a Pattern"
		awk '/no/' boogers.md
	} | bubble
	line
	{
		blue "Print Line Numbers"
		awk '{print NR, $0}' boogers.md
	} | bubble
	line
	{
		blue "Print Specific Line"
		awk 'NR == 2 {print $0}' boogers.md 
	} | bubble
	line
	{
		blue "Count Fields"
		awk '{print NF}' boogers.md
	} | bubble
	line
	{
		blue "Print Last Field"
		awk '{print $NF}' boogers.md
	} | bubble
	line
	{
		blue "Custom Field Separator"
		awk -F: '{print $1, $3, $7}' /etc/passwd
	} | bubble
	line
	{
		blue "Count Total Lines"
		awk 'END {print "Total Lines:", NR}' boogers.md
	} | bubble
} | bubble
