jq '.data.node | select(.__typename=="Page") | .timeline_feed_units.edges[].node'
