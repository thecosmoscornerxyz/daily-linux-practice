#!/usr/bin/env bash

# Create booger1.sh (Sender)
cat > booger1.sh <<'EOF'
#!/usr/bin/env bash

DATA=$(jq -n \
    --arg name "Friday" \
    --arg status "online" \
    '{name:$name,status:$status}')

echo "$DATA" | ./booger2.sh
EOF

# Create booger2.sh (Receiver)
cat > booger2.sh <<'EOF'
#!/usr/bin/env bash

DATA=$(cat)

NAME=$(jq -r '.name' <<< "$DATA")
STATUS=$(jq -r '.status' <<< "$DATA")

echo "$NAME is $STATUS"
EOF

# Execute
chmod +x booger1.sh booger2.sh
./booger1.sh
