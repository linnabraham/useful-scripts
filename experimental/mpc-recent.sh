#!/bin/env bash
# Script for listing out some in my music database more recent than a given year
from=$1
genre=$2
mpc list Date | grep -E '^[0-9]{4}' | while read date; do

  # year="${date:0:4}"
  # echo "Processing date: '$date' (Year: $year)"
  #if [[ "${date:0:4}" -gt $from ]]; then
  if (( "${date:0:4}" > $from )); then
	  if [[ "$2" != "" ]]; then
    		mpc find "((Genre == \"${2}\") AND (Date == \"$date\"))"
	else
    mpc find "(Date == \"$date\")"
# else
	# echo "Problematic" "$date"
	  fi
  fi
done
# done | mpc add
