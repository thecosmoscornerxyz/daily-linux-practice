#!/usr/bin/env bash

# Pretty Print JSON
jq "." servers.json

# Read One Field
jq ".hostname" servers.json

# Read Nested Field
jq ".system.os" servers.json

# Read Array
jq ".services[]" servers.json

# Read Array Element
jq ".services[0]" servers.json

# Raw Output (Remove JSON Quotes)
jq -r ".hostname" servers.json
