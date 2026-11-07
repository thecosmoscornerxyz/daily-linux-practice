#!/usr/bin/env bash

# Create Booger1.sh
cat > booger1.sh <<'EOF'

#!/usr/bin/env bash

DATA=$(jq -n \
	--arg name "Friday" \
	--arg status "online" \
	'{name:$name,status:$status}')

echo "$DATA" | ./booger2.sh
EOF

# Create Booger2.sh
cat > booger <<'EOF'

#!/usr/bin/env bash

DATA=$(cat)

NAME=$(jq -r '.name' <<< "$DATA")
STATUS=$(jq -r '.status' <<< "$DATA")

echo "$NAME is $STATUS"
EOF

# Execute
chmod 755 booger1.sh booger2.sh
./booger1.sh
