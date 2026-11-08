#!/usr/bin/env bash

line () {
	printf '%*s' 50 '' | tr ' ' '-'
	echo
}

blue () {
	gum style --foreground 39 "$@"
}

border () {
	gum style --border rounded
}

figlet "JQ"
line
{
	{
		blue "Pretty Print JSON"
		line
		{
			jq "." servers.json
		} | bubble
	} | bubble
	line
	{
		blue "Read One Field"
		line
		{
			jq ".hostname" servers.json
		} | bubble
	} | bubble
	line
	{
		blue "Read Array"
		line
		{
			jq ".services[]" servers.json
		} | bubble
	} | bubble
	line
	{
		blue "Read Array Element"
		line
		{
			jq ".services[0]" servers.json
		} | bubble
	} | bubble
	line
	{
		blue "Read Array Element"
		line
		{
			jq ".services[0]" servers.json
		} | bubble
	} | bubble
	line
	{
		blue "Raw Output (Remove JSON Quote)"
		line
		{
			jq -r ".hostname" servers.json
		} | bubble
	} | bubble
} | bubble
