#!/bin/bash
PICTURE=/tmp/i3lock.png
SCREENSHOT="maim $PICTURE"
BLUR="5x4"

$SCREENSHOT
convert $PICTURE -blur $BLUR $PICTURE
i3lock -i $PICTURE
rm $PICTURE
