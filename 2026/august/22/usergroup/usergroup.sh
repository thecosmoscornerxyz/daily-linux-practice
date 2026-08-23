#!/usr/bin/env bash

sudo useradd -m tempuser01 
sudo groupadd -f tempgroup
sudo usermod -aG tempuser01 tempgroup

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
grep tempyuser01 /etc/passwd
