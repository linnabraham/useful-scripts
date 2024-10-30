#!/bin/env bash
# Script for listing out some in my music database more recent than a given year
from=$1
mpc list Date | grep -E '^[0-9]{4}' | while read date; do

  # year="${date:0:4}"
  # echo "Processing date: '$date' (Year: $year)"
  #if [[ "${date:0:4}" -gt $from ]]; then
  if (( "${date:0:4}" > $from )); then
    mpc find "((Genre == \"Malayalam\") AND (Date == \"$date\"))"
# else
	# echo "Problematic" "$date"
  fi
done
# done | mpc add
