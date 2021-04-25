join -t, -v1 <(./get_ids.sh $1) <(cat $2 | grep ",$3," | sort -t ',' -k1 | csvtool cols 1,3 -) \
| sed 's/$/,0/g' | cat - <(cat $2 | grep ",$3," | sort -t ',' -k1 | csvtool cols 1,3 -) \
| sort -t ',' -k1