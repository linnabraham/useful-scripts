#!/bin/env bash
# Script to add music files modified in the last 30 days to mpd play queue

mpc clear
cd ~/Music &&

# add music modified in the last 30 days
find . -type f -mtime -30 -print0 | while IFS= read -r -d '' file; do
    mpc add "$(echo "$file" | sed 's|^\./||')"
done

