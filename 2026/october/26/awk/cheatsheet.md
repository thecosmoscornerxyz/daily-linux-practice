#!/usr/bin/env bash

echo "boogers boogers2 boogers3" | tee boogers.md
echo "no shit sherlock" >> boogers.md

figlet "awk practice"
echo

{
  gum style --foreground 39 "Print 1st Feild"
  awk '{print $1}' boogers.md
  echo
  gum style --foreground 39 "Match a Pattern"
  awk '/no/' boogers.md
  echo
  gum style --foreground 39 "Print Line Numbers"
  awk '{print NR, $0}' boogers.md
  echo
  gum style --foreground 39 "Print Specific Line"
  awk 'NR == 2 {print $0}' boogers.md
  echo
  gum style --foreground 39 "Count Fields"
  awk '{print NF}' boogers.md
  echo
  gum style --foreground 39 "Print Last Field"
  awk '{print $NF}' boogers.md
  echo
  gum style --foreground 39 "Custom Field Separator"
  awk -F: '{print $1, $3, $7}' /etc/passwd
  echo
  gum style --foreground 39 "Count Total Lines"
  awk 'END {print "Total Lines:", NR}' boogers.md
} | gum style \
        --border rounded \
        --padding "1 2" \
        --margin "1"
