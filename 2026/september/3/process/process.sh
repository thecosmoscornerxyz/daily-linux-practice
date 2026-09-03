#!/usr/bin/env bash

sleep 600 
echo $!
ps aux | grep sleep 
kill $!
