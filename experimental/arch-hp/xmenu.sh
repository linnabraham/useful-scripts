#!/bin/sh

cat <<EOF | xmenu | sh &
Apps
	Terminal	xfce4-terminal
	Music Player	mpdevil
	Xournal	        xournalpp
	Amplenote	gtk-launch brave-pfphgelppkenhllngngioolkaeelhlmi-Default
	Brave	        brave
	Zotero	        gtk-launch zotero
	Popcorn-Time	popcorntime
	iBroadcast	mediasynclite
Music
	Malayalam	mpc clear; mpc ls fixed/A-Z_fixed | mpc add; mpc shuffle; mpc play
	Tamil	        mpc clear; mpc ls fixed/tamil_fixed | mpc add; mpc shuffle; mpc play
	Hindi	        mpc clear; mpc ls fixed/hindi_fixed | mpc add; mpc shuffle; mpc play
	English	        mpc clear; mpc ls fixed/eng_fixed | mpc add; mpc shuffle; mpc play
	All		mpc clear; mpc ls fixed/ | mpc add; mpc shuffle; mpc play
	Recent		cd ~/Music && find . -type f -mtime -30  | awk '{ sub(/^\.\//, ""); print }' | mpc add
Actions
	New-workspace	i3-msg workspace $(($(i3-msg -t get_workspaces | jq 'max_by(.num) | .num')+1))
	Screen Record	rofi-screenshot 
	X-Terminate	xkill
	Screenshot	xmenu-screenshot.sh
	Polybar Toggle		xdo id -m -N Polybar && polybar-msg cmd toggle
Sticky-Note	globonote

PCManFM-Qt	pcmanfm-qt
Refresh-Wallpaper	        	setbg -s "$HOME/Downloads/wallpapers"
Logout	lxsession-logout
EOF
