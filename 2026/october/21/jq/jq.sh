#!/usr/bin/env bash

line () {
	printf '%%s' 50 '' | tr ' ' '-'
	echo
}

blue () {
	gum style --foreground 39 "$@"
}

bubble () {
	gum style --border rounded
}

figlet "JQ"
line
{
	{
		blue "Pretty Print JSON"
		line
		{
			jp "." servers.json
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
		blue "Read Nested Field"
		line
		{
			jq ".system.os" servers.json
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
		blue "Raw Output (remove JSON quotes)"
		line
		{
			jq -r ".hostname" servers.json
		} | bubble
	} | bubble
} | bubble
