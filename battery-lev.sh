#!/bin/bash
# Script to show desktop notification if battery level drops below a threshold
while true; do
    battery_status=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)
    battery_level=$(echo "$battery_status" | grep -oP 'percentage:\s+\K\d+')
    
    if [ "$battery_level" -le 20 ]; then
        notify-send "Low Battery Alert" "Battery level is $battery_level%"
    fi
    
    sleep 300  # Check every 5 minutes (adjust as needed)
done
