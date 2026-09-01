#!/usr/bin/env bash

SERVICE=cups

echo "$SERVICE status"
systemctl status "$SERVICE" --no-pager
echo
echo "Restarting"
sudo systemctl restrat "$SERVICE"
echo
echo "Enable"
sudo systemctl enable "$SERVICE" 
echo
echo "Last 10 Log Lines"
journalctl -u "$SERVICE" -n 10 --no-pager
echo
echo "Disable"
sudo systemctl disable "$SERVICE"
echo
echo "Stop"
sudo systemctl stop "$SERVICE"
echo
echo "Final Status"
systemctl status "$SERVICE" --no-pager
