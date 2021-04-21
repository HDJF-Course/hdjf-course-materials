#!/bin/bash
P=$1

# get the profile
twarc timeline $P | ./twitter_json2csv.sh

# remove log
rm -f twarc.log