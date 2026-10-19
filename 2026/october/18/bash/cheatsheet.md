#!/usr/bin/env bash

# FOR
for name in cosmos friday waffles; do
    echo "$name"
done

# C-STYLE FOR
for ((i=1; i<=3; i++)); do
    echo "$i"
done

# WHILE
count=1

while [[ $count -le 3 ]]; do
    echo "$count"
    ((count++))
done

# WHILE READ
while read -r line; do
    echo "$line"
done < names.txt
