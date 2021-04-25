echo id,like,love,anger,haha,support,sorry,wow
./get_ids.sh $1 \
	| join -t, - <(./get_specific_reaction.sh $1 $2 LIKE) \
	| join -t, - <(./get_specific_reaction.sh $1 $2 LOVE) \
	| join -t, - <(./get_specific_reaction.sh $1 $2 ANGER) \
	| join -t, - <(./get_specific_reaction.sh $1 $2 HAHA) \
	| join -t, - <(./get_specific_reaction.sh $1 $2 SUPPORT) \
	| join -t, - <(./get_specific_reaction.sh $1 $2 SORRY) \
	| join -t, - <(./get_specific_reaction.sh $1 $2 WOW)
