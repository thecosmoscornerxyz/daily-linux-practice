#!/usr/bin/env bash

SERVICE=cron # or cups, ssh, etc

echo "== $SERVICE status =="
systemctl status "$SERVICE" --no-pager | head -n 10

echo "== Restarting =="
sudo systemctl restart "$SERVICE"

echo "== Enabling at Boot"
sudo systemctl enable "$SERVICE"

echo "== Last 10 Log Lines =="
journalctl -u "$SERVICE" -n 10 --no-pager

echo "== Disabling Service =="
sudo systemctl disable "$SERVICE"

echo "== Stopping Service =="
sudo systemctl stop "$SERVICE"

echo "== Final Status =="
systemctl status "$SERVICE" --no-pager | head -n 10