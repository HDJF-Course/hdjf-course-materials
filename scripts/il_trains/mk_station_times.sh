echo Code,DayST,DayF,DaySNight
cat stations.json \
| jq ".Data[]" \
| jq -r -s '
	map(.General.StationCode),
	map(.StationTimes[0].DayST),
	map(.StationTimes[0].DayF),
	map(.StationTimes[0].DaySNight) 
	| @csv' \
| csvtool transpose -  

