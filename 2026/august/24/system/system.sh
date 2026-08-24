#!/usr/bin/env bash

echo "Linux Warmup"
echo
echo "User: $(whoami)"
echo "Uptime: $(uptime -p)"
echo "Today is: $(date)"
echo "Hostname: $(hostname)"
echo
echo "Disk Usage: "
df -h /
echo
echo "IP Address:"
ip -brief addr
echo
echo "SSH Service:"
systemctl is-active ssh || systemctl status ssh | head -n 10
