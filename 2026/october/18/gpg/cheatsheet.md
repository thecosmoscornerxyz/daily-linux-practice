#!/usr/bin/env bash

# Encrypt file
gpg -c secret.txt

# Decrypt file
gpg -o decrypted.txt -d secret.txt.gpg
