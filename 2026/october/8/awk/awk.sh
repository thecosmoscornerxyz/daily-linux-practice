#!/usr/bin/env bash

line () {
	printf '%*s' 50 '' | tr ' ' '-'
	echo
}

bubble () {
	gum style --border rounded
}

blue () {
	gum style --foreground 39 "$@"
}

figlet "Awk"
line
{
	echo "boogers boogers2 boogers" >> boogers.md
	{
		blue "Print 1st Field"
		line
		awk '{print $1}' boogers.md 2>/dev/null
	} | bubble
	line
	{
		blue "Match a Pattern"
		line
		awk '/no/' boogers.md 2>/dev/null
	} | bubble
	line
	{
		blue "Print Line Numbers"
		line
		awk '{print NR, $0}' boogers.md 2>/dev/null
	} | bubble
	line
	{
		blue "Print Specific Line"
		line
		awk 'NR == 2 {print $0}' boogers.md 2>/dev/null
	} | bubble
	line
	{
		blue "Count Fields"
		line
		awk '{print NF}' boogers.md 2>/dev/null
	} | bubble
	line
	{
		blue "Print Last Field"
		line
		awk '{print $NF}' boogers.md 2>/dev/null
	} | bubble
	line
	{
		blue "Custom Field Separator"
		line
		awk -F: '{print $1, "|", $3, "|", $7}' boogers.md 2>/dev/null
	} | bubble
	line
	{
		blue "Count Total Lines"
		line
		awk 'END {print "Total Lines:" NR}' boogers.md 2>/dev/null
	} | bubble
} | bubble
