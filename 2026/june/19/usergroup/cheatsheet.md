#!/usr/bin/env bash

# Create a Temp User
sudo useradd -m tempuser01
echo "Temp user created:"
grep tempuser01 /etc/passwd

# Add to a group (Create One if Needed)
sudo groupadd -f tempgroup
sudo usermod -aG tempgroup tempuser01

echo "Groups for tempuser01:"
id tempuser01

# Check /etc/passwd & /etc/shadow entries
echo "passwd entry:"
grep tempuser01 /etc/passwd
echo "shadow entry (hashed passwd only):"
sudo grep tempuser01 /etc/shadow

# Cleanup
sudo userdel -r tempuser01
echo "User Deleted"