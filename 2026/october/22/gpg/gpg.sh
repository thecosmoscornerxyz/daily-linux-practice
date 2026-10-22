#!/usr/bin/env bash

gpg -c secret.txt

gpg -o decrypted.txt -d secret.txt.gpg
