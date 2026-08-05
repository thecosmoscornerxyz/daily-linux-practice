#!/usr/bin/env python3

echo "Linux Warmup"
echo
echo "User: $(whoami)"
echo "Hostname: $(hostname)"
echo "Today is: $(date)"
echo "Uptime: $(uptime -p)"
echo
echo "Disk Usage:" 
df -h /
echo
echo "IP Address:"
ip -brief addr
echo
echo "SSH Service:"
systemctl is-active ssh || systemctl status ssh | head -n 10
