#!/usr/bin/env bash

gpg -c secret.txt

sudo timeout 10 gpg -o decrypted.txt -d secret.txt.gpg
