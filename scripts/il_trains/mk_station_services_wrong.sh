echo "Code,Service"
cat stations.json | jq ".Data[]" \
	| jq -r -s '
		map(.StationCode),
		map(.InStation[0].NameEng),
		map(.InStation[1].NameEng),
		map(.InStation[2].NameEng),
		map(.InStation[3].NameEng),
		map(.InStation[4].NameEng),
		map(.InStation[5].NameEng),
		map(.InStation[6].NameEng),
		map(.InStation[7].NameEng),
		map(.InStation[8].NameEng),
		map(.InStation[9].NameEng),
		map(.InStation[10].NameEng),
		map(.InStation[11].NameEng),
		map(.InStation[12].NameEng),
		map(.InStation[13].NameEng),
		map(.InStation[14].NameEng),
		map(.InStation[15].NameEng) 
		| @csv' \
	| csvtool transpose -  \
	| sed 's/"Accessibility "/Accessibility/g'

