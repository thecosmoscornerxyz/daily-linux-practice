#!/usr/bin/env bash

for name in cosmos friday waffles; do
	echo "$name"
done

for ((i=1; i<=3; i++)); do
	echo "$i"
done

count =1
while [[ $count -le 3 ]]; do
	echo "$count"
	((count++))
done

while read -r line; do
	echo "$line"
done < names.txt
