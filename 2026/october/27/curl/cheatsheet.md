#!/usr/bin/env bash

# Basic GET Request
curl https://httpbin.org/get

# Show Response Headers
curl -I https://example.com

# Follow Redirects
curl -L https://example.com

# Save Response to File
curl -o response.json https://httpbin.org/get

# Silent Request
curl -s https://httpbin.org/get
