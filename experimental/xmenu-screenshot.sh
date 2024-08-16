#/bin/sh

notify-send -t 2000 "Notification" "Wait 5 seconds for a screenshot.." && sleep 5
timestamp=$(date '+%Y%m%d-%H%M%S')
import -silent -window root ~/Pictures/screenshots/"$timestamp".png
xclip -selection clipboard -t image/png -i ~/Pictures/screenshots/"$timestamp".png
notify-send -t 1000 "Copied file $timestamp.png to clipboard"
