echo Code,NameEnglish,NameHebrew
cat info.json  \
| jq ".Station[].Value" \
| jq -s -r 'map(.Code),map(.EN),map(.HE) | @csv' \
| csvtool transpose -
