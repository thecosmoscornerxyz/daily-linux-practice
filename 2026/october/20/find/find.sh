#!/usr/bin/env bash

find . -name "*.md"
find . -type f
find . -type d
find . -type f -size +1M
find . -type f -mtime -7
