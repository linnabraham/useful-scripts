#!/bin/bash
MPC="mpc --quiet -p ${1:-6600}"

# max height for vertical menu
height=20

DMENU() {
    # Vertical menu if $3 is given
    echo -e "$1" | dmenu -i -p "$2" ${3:+"-l" "$3"}
}

get_playlist() {
    $MPC -f "%position% - %artist% - %album% - %title%" playlist
}

select_from() {
    DMENU "$1" "Select $2" $height
}

add() {
    all="[ALL]"

    local artist=$(select_from "$($MPC list Artist)\n$all" "artist")

    if [ "$artist" = "$all" ]; then
        $MPC listall | $MPC add;
    elif [ -n "$artist" ]; then
        local albums=$($MPC list Album Artist "$artist")
        local album=$(select_from "$albums\n$all" "album")

        if [ "$album" = "$all" ]; then
            $MPC findadd Artist "$artist"
        elif [ -n "$album" ]; then
            local songs=$($MPC list Title Album "$album")
            local song=$(select_from "$songs\n$all" "song")

            if [ "$song" = "$all" ]; then
                $MPC findadd Album "$album"
            elif [ -n "$song" ]; then
                $MPC findadd Title "$song"
            fi
        fi
    fi
}

remove() {
    local playlist=$(get_playlist)
    local song=$(select_from "$playlist" "song")

    [ -n "$song" ] && $MPC del "${song%%\ *}"
}

jump() {
    local playlist=$(get_playlist)
    local song=$(select_from "$playlist" "song")

    [ -n "$song" ] && $MPC play "${song%%\ *}"
}

toggle(){
    $MPC toggle
}

play(){
    $MPC play
}

pause(){
    $MPC pause
}

stop(){
    $MPC stop
}

next(){
    $MPC next
}

prev(){
    $MPC prev
}

single(){
# get the current state of single mode
single_mode=$(mpc status | grep -o 'single: \w*' | cut -d' ' -f2)

if [ "$single_mode" == "on" ]; then
    $MPC single off
    #echo "single mode turned off"
else
    $MPC single on
    #echo "single mode turned on"
fi
}
shuffle(){
	$MPC shuffle
}
repeat(){
	repeat_mode=$(mpc repeat | grep -o 'repeat: \w*' | cut -d' ' -f2)
	if [[ "$repeat_mode" == "off" ]]; then
		$MPC repeat on
	else
		$MPC repeat off
	fi
}

while true; do
	action=$(DMENU "Clear\nAdd\nJump\nPlay\nPause\nStop\nNext\nPrev\nSingle\nRandom\nRepeat" "Do you want to")
    case $action in
        Clear) $MPC clear;;
        Add) add;;
        Remove) remove;;
        Jump) jump;;
        Pause) pause;;
        Toggle) toggle;;
        Play) play;;
        Stop) stop;;
        Next) next;;
        Prev) prev;;
		Single) single;;
		Random) shuffle;;
		Repeat) repeat;;
        "") exit 0;;
    esac
done
