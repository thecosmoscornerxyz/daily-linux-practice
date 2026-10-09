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

figlet "Cron"
line
{
	{
		blue "Create Script"
		line
		echo 'echo "boogers"' >> boogers.sh
		cat boogers.sh
	}
	{
		blue "List Cron Jobs"
		line
		cron -l
	} | bubble
	line
	{
		Blue "Edit Cron Jobs"
		line
#		cron -E
	} | bubble
} | bubble
