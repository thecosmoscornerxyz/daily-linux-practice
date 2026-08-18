#!/usr/bin/env bash

rm -f file1 file2

touch file1 file2

echo "== Before =="
ls -l

chmod 600 file1
chmod 754 file2

sudo chown root:root file1
sudo chown "$USER":"$USER" file2

echo "== After =="
ls -l

echo "file 1 should be rw-------"
echo "file2 should be rwxr-xr--"