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
		line
		cat boogers.md
	} | bubble
	{
		blue "Print First Field"
		line
		awk '{print $1}' boogers.md
	} | bubble
	{
		blue "Match a Pattern"
		line
		awk '/no/' boogers.md
	} | bubble
	{
		blue "Print Line Numbers"
		line
		awk '{print NR, $0}' boogers.md
	} | bubble
	{
		blue "Print Specific Line"
		line
		awk 'NR ==2 {print $0}' boogers.md
	} | bubble
	{
		blue "Count Fields"
		line
		awk '{print NF}' boogers.md
	} | bubble
	{
		blue "Print Last Field" 
		line
		awk '{print $NF}' boogers.md
	} | bubble
	{
		blue "Custom Field Separator"
		line
		awk -F: '{print $1, $3, $7}' /etc/passwd
	} | bubble
	{
		blue "Count Total Lines"
		line
		awk 'END {print "Total Lines:", NR}' boogers.md
	} | bubble
} | bubble
