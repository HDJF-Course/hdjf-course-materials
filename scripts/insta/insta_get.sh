#!/bin/bash
P=$1

# start clean
rm -rf $P/

# get profile
instaloader $P

# uncompress all jsons
ls -1 $P/*json.xz | parallel unxz

# build csv file from jsons
cat $P/[0-9]*.json | ./insta_json2csv.sh >$P/$P.csv

# pack images and csv into a zip
zip - $P/$P.csv $P/*jpg 

# end clean
rm -rf $P/


