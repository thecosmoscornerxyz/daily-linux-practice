#!/usr/bin/env bash

jq "." servers.json
jp ".hostname" servers.json
jq ".system.os" servers.json
jq ".services[]" servers.json
jq ".services[0]" servers.json
jq -r ".hostname" servers.json
