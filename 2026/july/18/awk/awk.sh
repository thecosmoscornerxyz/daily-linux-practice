#!/usr/bin/env bash

echo "boogers boogers2 boogers3" | tee boogers.md
echo "no shit sherlock" >> boogers.md

awk '{print $!}' boogers.md
awk '/no/' boogers.md
