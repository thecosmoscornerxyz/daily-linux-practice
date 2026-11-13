
DATA=$(jq -n \
	--arg name "Friday" \
	--arg status "online" \
	'{name:$name,status:$status}')

echo "$DATA" | ./booger2.sh
