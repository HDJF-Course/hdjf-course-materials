echo Code,Latitude,Longitude,Area,NameHebrew,NameEnglish,DayST,DayF,DaySNight
cat stations.json \
| jq ".Data[]" \
| jq -r -s '
	map(.General.StationCode),
	map(.General.Lat),
	map(.General.Long),
	map(.General.StationArea),
	map(.Hebrew.StationName),
	map(.English.StationName),
	map(.StationTimes[0].DayST),
	map(.StationTimes[0].DayF),
	map(.StationTimes[0].DaySNight) 
	| @csv' \
| csvtool transpose -  

