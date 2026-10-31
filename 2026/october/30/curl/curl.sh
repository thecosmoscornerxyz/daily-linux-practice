#!/usr/bin/env bash

line () {
	printf '*%s' 50 '' | tr ' ' '-'
	echo
}

blue () {
	gum style --foreground 39 "$@"
}

bubble () {
	gum style --border rounded
}

figlet "Curl"
line
{
	{
		blue "Basic GET Request"
		line
		{
			curl https://httpbin.org/get
		} | bubble
	} | bubble
	line
	{
		blue "Show Response Headers"
		line
		{
			curl -I https://example.com
		} | bubble
	} | bubble
	line
	{
		blue "Follow Redirects"
		line
		{
			curl -L httsp://example.com
		} | bubble
	} | bubble
	line
	{
		blue "Save Response to File"
		line
		{
			curl -o response.json https://httpbin.org/get
		} | bubble
	} | bubble
	line
	{
		blue "Silent Request"
		line
		{
			curl -s https://httpbin.org/get
		} | bubble
	} | bubble
} | bubble
