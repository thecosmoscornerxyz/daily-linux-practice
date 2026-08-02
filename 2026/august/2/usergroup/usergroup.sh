#!/usr/bin;/env bash

sudo useradd -m tempuser01 
sudo groupadd -f tempgroup
sudo usermod -aG tempgroup tempuser01

echo "tempuser01 created"
grep tempuser01 /etc/passwd
echo "groups"
id tempuser01
echo
echo "passwd entry:"
grep tempuser01 /etc/passwd
echo "shadow entry(hashed)"
sudo grep tempuser01 /etc/shadow
echo
echo "tempuser01 deleted"
sudo userdel -r tempuser01
grep tempuser01 /etc/passwd
