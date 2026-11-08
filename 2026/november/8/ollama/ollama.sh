#!/usr/bin/env bash

HOST="http://localhost:11434"
MODEL="llama3.2"
messages='[]'

while true; do
	read -rp "You: " input || break

	[[ "$input" == "exit" ]] && break
	[[ -z "$input" && continue ]] && continue

	messages=$(jq -c --arg msg "$input" \
	'. + [{"role":"user","content":$msg}]' <<< "$messages")

	payload=$(jq -n \
		--arg model "$MODEL" \
		--argjson messages "$messages" \
		'{model:$model, messages:$messages, stream:false}')

	response=$(curl -fsS "$HOST/api/chat" \
		-H "Content-Type: application/json" \
		-d "$payload") || break

	reply=$(jq -r '.message.content' <<< "$response") || break

	echo "Friday: $reply"

	messages=$(jq -c --arg msg "$reply" \
		'. + [{"role":"assistant","content":$msg}]' <<< "$messages")
done
