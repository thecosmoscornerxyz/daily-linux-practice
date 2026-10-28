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
			jq ".services[]" server.json
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
		blue "Row Output (Remove JSON Quotes)"
		line
		{
			jq -r ".hostname" server.json
		} | bubble
	} | bubble
} | bubble
