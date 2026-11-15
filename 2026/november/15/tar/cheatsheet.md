#!/usr/bin/env bash

# Create archive
tar -czf backup.tar.gz testdir/

# Inspect archive without extracting
tar -tzf backup.tar.gz

# Extract archive
tar -xzf backup.tar.gz
