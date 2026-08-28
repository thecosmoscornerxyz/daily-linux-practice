#!/usr/bin/env bash

echo "Linux Warmup"
echo
echo "User: $(whoami)"
echo "Hostname: $(hostname)"
echo "Today is: $(date)"
echo "Uptime: $(uptime -p)"
echo
echo "IP Address: "
ip -brief addr
echo
echo "Disk Usage: "
df -h /
echo
echo "SSH Service:"
systemctl is-active ssh || systemtctl ssh | head -n 10
