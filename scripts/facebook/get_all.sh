#!/bin/bash

# establish prefix
if [ -z "$1" ]
  then
  	P=o
  else
    P="$1"
fi

# create temporary files
TMP1=$(mktemp)
TMP2=$(mktemp)
TMP3=$(mktemp)
TMP4=$(mktemp)


# get raw stories csv
./get_graphql_rsp.sh  | ./get_stories_json.sh | ./get_stories.sh | ./remove_dups.py | csvtool cols 2- - >$TMP1

# get raw reactions csv
./get_reactions.sh $TMP1 >$TMP2

# organize reactions 
./join_reactions.sh $TMP1 $TMP2 >$TMP4

# clean stories
cat $TMP1 | csvtool cols 1-22 - >$TMP3

# final merge
./merge.py $TMP3 $TMP4  | csvtool cols 2- - >${P}_stories.csv

# remove temporary files
rm -f $TMP1 $TMP2 $TMP3 $TMP4
#echo $TMP3
