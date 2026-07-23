#!/usr/bin/env bash

echo "Linux Warmup"
echo
echo "User: $(whoami)"
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"
echo "Today is: $(date)"
echo
echo "Disk Usage:"
df -h /
echo
echo "IP Address:"
ip -brief addr
echo
echo "SSH Service:"
systemctl status ssh || systemctl status ssh | head -n 10
