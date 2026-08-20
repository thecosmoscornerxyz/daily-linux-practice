#!/usr/bin/env bash

echo "Linux Warmup"
echo
echo "User: $(whoami)"
echo "Hostname: $(hostname)"
echo "Today is: $(date)"
echo "Uptime: $(uptime -p)"
echo
echo  "Disk Usage:"
df -h /
echo
echo "IP Address:"
ip -brier addr
echo
echo "SSH Service:"
systemctl is-active ssh || systemctl status ssh | head -n 10
