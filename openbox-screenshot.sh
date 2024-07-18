#/bin/sh

timestamp=$(date '+%Y%m%d-%H%M%S')
import -silent -window root ~/Pictures/screenshots/"$timestamp".png
xclip -selection clipboard -t image/png -i ~/Pictures/screenshots/"$timestamp".png
notify-send "Copied file $timestamp.png to clipboard"
