#!/usr/bin/env bash

echo "=== Linux Warmup ==="
echo "User: $(whoami)
"echo "Hostname: $(hostname)"
echo "Today is: $(date)"
echo "Uptime: $(uptime -p)"
echo "Current Directory: $(pwd)"
echo
echo "Disk Usage:"
df -h / 
echo
echo "IP Addresses"
ip -brief addr
echo
echo "SSH Service:"
systemctl is-active ssh || systemctl status ssh --no-pagher | head -n 5