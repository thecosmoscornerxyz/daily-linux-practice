#!/usr/bin/env bash

echo "boogers boogers2 boogers3" | tee boogers.md
echo "no shit sherlock" >> boogers.md

echo '{print $1}' boogers.md
echo '/no/' boogers.md
