#!/usr/bin/env bash

awk '{print $1}' boogers.md

awk '/no/' boogers.md

awk '{print NR, $0}' boogers.md

awk 'NR == 2 {print $0}' boogers.md

awk '{print NF}' boogers.md

awk '{print $NF}' boogers.md

awk -F: '{print $1, "|", $3, "|", $7}' /etc/passwd

awk 'END {print "Total Lines:", NR}' boogers.md
