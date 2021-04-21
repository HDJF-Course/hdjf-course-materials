echo Code,Latitude,Longitude,Area
cat stations.json \
| jq ".Data[]" \
| jq -r -s '
	map(.General.StationCode),
	map(.General.Lat),
	map(.General.Long),
	map(.General.StationArea)
	| @csv' \
| csvtool transpose -  

