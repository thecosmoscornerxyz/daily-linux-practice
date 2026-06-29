#!/usr/bin/env bash

echo "Linux Warmup"
echo
echo "User: $(whoami)"
echo "Uptime: $(uptime -p)"
echo "Hostname: $(hostname)"
echo "Today is: $(date)"
echo
echo "Disk Usage:"
df -h /
echo
echo "IP Address:"
ip -brief addr
echo
echo "SSH Service:"
systemctlt is-active ssh || systemctl status ssh | head -n 10
