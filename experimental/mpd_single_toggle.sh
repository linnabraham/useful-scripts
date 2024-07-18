#!/bin/bash
MPC="mpc --quiet -p ${1:-6600}"
# get the current state of single mode
single_mode=$(mpc status | grep -o 'single: \w*' | cut -d' ' -f2)

if [ "$single_mode" == "on" ]; then
    $MPC single off
    msg="single mode turned off"
    notify-send "$msg"
else
    $MPC single on
    msg="single mode turned on"
    notify-send "$msg"
fi
