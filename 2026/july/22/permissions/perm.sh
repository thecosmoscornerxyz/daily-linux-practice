#!/usr/bin/env bash

rm -f file1 file2
touch file1 file2

echo "before"
ls -l
echo

chmod 600 file1
chmod 754 file2
chown root:root file1
chown "$USER":"$USER" file2

echo "file1 should be rw-------"
echo "file2 should be rwxr-xr--"
