#!/usr/bin/env bash
# If no audio instance is running leave empty
# If player is in paused state display a play button
# Else display the title of the audio

playerctlstatus=$(playerctl status 2> /dev/null)

if [[ $playerctlstatus ==  "" ]]; then
    echo ""

elif playerctl status -a | grep -q "Playing"; then
    echo "%{A1:playerctl pause:}%{A6:playerctl next:}%{A8:playerctl previous:}`playerctl metadata title | cut -d " " -f1-5`%{A}%{A}%{A}"
else
    playerctl metadata title 2>/dev/null  &&  echo "%{A1:playerctl --player=mpd,%any play:} `playerctl --player=mpd,%any metadata title | cut -d " " -f1-5`%{A}"
fi
