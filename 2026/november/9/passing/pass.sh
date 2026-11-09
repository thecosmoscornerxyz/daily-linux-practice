#!/usr/bin/env bash

cat booger1.sh << 'EOF'

DATA=$(jq -n \
	--arg name "Friday" \
	--arg status "online" \
	'{name:$name,status:$status}')

echo "$DATA" | ./booger2.sh
EOF

cat > booger2.sh << 'EOF'

DATA=$(cat)

NAME=$(jq -r '.name' <<< "$DATA")
STATUS=$(jq -r '.status' <<< "$DATA")

echo "$NAME" is "$STATUS"
EOF

chmod 755 booger1.sh booger2.sh
./booger1.sh
