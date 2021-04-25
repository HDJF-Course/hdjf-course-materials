jq -r '
	.log.entries[] 
	| select(.request.url=="https://www.facebook.com/api/graphql/") 
	| .response.content.text' \
	| jq 2>/dev/null 'del(.[] | nulls)'
