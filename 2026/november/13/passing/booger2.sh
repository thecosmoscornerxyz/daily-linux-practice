
DATA=$(cat)

NAME=$(jq -r '.name' <<< "$DATA")
STATUS=$(jq -r '.status' <<< "$DATA")

echo "$NAME is $STATUS" 
