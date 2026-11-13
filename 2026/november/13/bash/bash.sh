#!/usr/bin/env bash

for item in apple banana cherry; do
	echo "$item"
done

for ((i=1; i<=5; i++)); do
	echo "$i"
done

count=1
while [[ $count -le 5 ]]; do
	echo "$count"
	((count++))
done

count=1
until [[ $count -gt 5 ]]; do
	echo "$count"
	((count++))
done
