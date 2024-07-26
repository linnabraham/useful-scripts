#!/usr/bin/env bash
# If no audio instance is running leave empty
# If player is in paused state display a play button
# Else display the title of the audio

playerctlstatus=$(playerctl status 2> /dev/null)

if [[ $playerctlstatus ==  "" ]]; then
    echo ""
elif [[ $playerctlstatus =~ "Playing" ]]; then
    echo "%{A1:playerctl --player=mpdevil,%any pause:}%{A6:playerctl next:}%{A8:playerctl previous:}`playerctl metadata title | cut -d " " -f1-5`%{A}%{A}%{A}"
else
    echo "%{A1:playerctl --player=mpdevil,%any play:}%{A}"
fi
