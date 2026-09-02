#!/usr/bin/env bash

echo "boogers boogers2 boogers3" | boogers.md
echo "no shit sherlock" >> boogers.md

awk '{print $1}' boogers.md
awk '/no/' boogers.md
