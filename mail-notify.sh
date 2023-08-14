#!/bin/bash

startcount=$(checkmail)
while true; do
sleep 5400s
	mailcount=$(checkmail)
	newcount=$(($mailcount-$startcount))
echo $newcount
if [[ $newcount -gt 0 ]]; then
    notify-send -t 0 "You have $newcount new mail(s)" "<a href=\"https://mail.google.com/\">Open</a>"
    startcount=$mailcount
else
    echo "No new mails.."
fi
done
