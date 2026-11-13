#!/usr/bin/env bash

while IFS = read -r request; do

	method=$(jq -r '.method // empty' <<< "$request")
	id=$(jq -c '.id // null' <<< "$request")

	case "$method" in

		initialize)
			jq -nc --argjson id "$id" '{
				jsonrpc:"2.0",
				id:$id,
				result:{
					protocolVersion:"2025-06-18",
					capabilities:{tools:{}},
					serverInfo:{name:"daily-mcp",version:"1.0"}
				}
			}'
			;;

		tools/list)
			jq -nc --argjson id "$id" '{
				jsonrpc:"2.0",
				id:$id,
				result:{
					tools:[{
						name:"get_hostname",
						description:"Get the Linux Hostname",
						inputSchema:{type:"object",properties:{}}
					}]
				}
			}'
			;;

		tools/call)
			name=$(jq -r '.params.name // empty' <<< "$request")


			if [[ "$name" == "get_hostname" ]]; then
				hostname=$(hostname)

				jq -nc --argjson id "$id" --arg host "$hostname" '{
					jsonrpc:"2.0",
					id:$id,
					result:{
						content:[{type:"text",text:$host}]
					}
				}'
			fi
			;;

	esac
done
