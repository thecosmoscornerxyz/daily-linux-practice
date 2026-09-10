#!/usr/bin/env bash

cut -d" " -f1 boogers.md
cut -d" " -f1,3 boogers.md
cut -c1-5 boogers.md
cut -d: -f1,7 /etc/passwd