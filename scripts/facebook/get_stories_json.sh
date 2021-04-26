jq 2>/dev/null '
	.data.node 
	| select(.__typename=="Page") 
	| .timeline_feed_units.edges[].node'
