#!/bin/sh
cat <<EOF | xmenu | sh &
Apps
	PCManFM-Qt	pcmanfm-qt
	Amplenote	gtk-launch brave-pfphgelppkenhllngngioolkaeelhlmi-Default
	Brave	        brave
	Zotero	        gtk-launch zotero
	Popcorn-Time	popcorntime
	Terminal	xfce4-terminal
	Telegram	telegram-desktop
	ZapZap		zapzap
Appmenu	jgmenu_run
Music
	Player		mpdevil
	iBroadcast	mediasynclite
	Picard		picard
	Puddletag	puddletag
	Playlist
		Malayalam	mpc clear; mpc ls fixed/A-Z_fixed | mpc add; mpc shuffle; mpc play
		Tamil	        mpc clear; mpc ls fixed/tamil_fixed | mpc add; mpc shuffle; mpc play
		Hindi	        mpc clear; mpc ls fixed/hindi_fixed | mpc add; mpc shuffle; mpc play
		English	        mpc clear; mpc ls fixed/eng_fixed | mpc add; mpc shuffle; mpc play
		Recent		cd ~/Music && find . -type f -mtime -30  | awk '{ sub(/^\.\//, ""); print }' | mpc add; mpc play
		All		mpc clear; mpc ls fixed/ | mpc add; mpc shuffle; mpc play
Actions
	Display Off	xset dpms force off
	New-workspace	switch-i3-workspace.sh
	Screen Record	rofi-screenshot 
	X-Terminate	xkill
	Screenshot	xmenu-screenshot.sh
	Polybar Toggle		xdo id -m -N Polybar && polybar-msg cmd toggle
Sticky-Note	globonote

Refresh-Wallpaper	        	setbg -s "$HOME/Downloads/wallpapers"
Lock	blurlock.sh
Logout	lxsession-logout
EOF
