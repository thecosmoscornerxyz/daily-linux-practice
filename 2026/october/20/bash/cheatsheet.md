#!/usr/bin/env bash

# For Loop
for item in apple banana cherry; do
    echo "$item"
done

# C-Style For Loop
for ((i=1; i<=5; i++)); do
    echo "$i"
done

# While Loop
count=1
while [[ $count -le 5 ]]; do
    echo "$count"
    ((count++))
done

# Until Loop
count=1
until [[ $count -gt 5 ]]; do
    echo "$count"
    ((count++))
done
