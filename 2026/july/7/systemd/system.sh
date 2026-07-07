#!/usr/bin/env bash

SERVICE=cups

echo "$SERVICE status"
systemctl status "$SERVICE" --no-pager
echo
echo "Restarting"
sudo systemctl restart "$SERVICE"
echo
echo "Enable at Boot"
sudo systemctl enable "$SERVICE"
echo
echo "Last 10 Log Lines"
journalctl -u "$SERVICE" --no-pager
echo
echo "Disable"
sudo systemctl disable "$SERVICE"
echo
echo "Stop"
sudo systemctl stop "$SERVCIE"
echo
echo "Final Status"
systemctl status "$SERVICE" --no-pager
