#!/usr/bin/env bash

bubble() {
    gum style --border rounded
}

blue() {
    gum style --foreground 39 "$@"
}

line() {
    printf '%*s' 50 '' | tr ' ' '-'
    echo
}

sudo useradd -m tempuser01 2> /dev/null
sudo groupadd -f tempgroup 2> /dev/null
sudo usermod -aG tempgroup tempuser01 2> /dev/null

figlet Permissions
line

{
    blue "Create File1 File2"
    line
    rm -f file1 file2
    touch file1 file2
    echo
    blue "before"
    ls -l | bubble
    line
    chmod 600 file1
    chmod 754 file2
    sudo chown root:root file1
    sudo chown "$USER":"$USER" file2
    echo
    blue "after"
    ls -l | bubble
    echo
    blue "File Permissions"
    echo "file1 should be rw-------" | bubble
    echo "file2 should be rwxr-xr--" | bubble
} | bubble
