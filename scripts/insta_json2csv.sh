echo "text,comments,timestamp,likes,location"
jq -s -r 'map(.node.edge_media_to_caption.edges[0].node.text // empty| gsub("\n";" ")), map(.node.edge_media_to_comment.count), map(.node.taken_at_timestamp), map(.node.edge_media_preview_like.count),map(.node.location.slug) | @csv ' \
	| csvtool transpose -
