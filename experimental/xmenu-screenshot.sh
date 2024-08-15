#/bin/sh

notify-send -t 0 "Notification" "Wait 5 seconds for a screenshot.." && sleep 5
timestamp=$(date '+%Y%m%d-%H%M%S')
import -silent -window root ~/Pictures/screenshots/"$timestamp".png
xclip -selection clipboard -t image/png -i ~/Pictures/"$timestamp".png
notify-send "Copied file $timestamp.png to clipboard"
