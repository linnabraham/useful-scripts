#!/bin/sh

cat <<EOF | xmenu | sh &
Apps
	Brave	brave
	Amplenote	gtk-launch brave-pfphgelppkenhllngngioolkaeelhlmi-Default
	Picard	picard
	Zotero	gtk-launch zotero
	Terminal	xfce4-terminal
Music
	Recent	mpc-add-recent.sh
	All	mpc clear; mpc ls fixed/ | mpc add; mpc shuffle; mpc play
	Language
		English	        mpc clear; mpc ls fixed/eng_fixed | mpc add; mpc shuffle; mpc play
		Malayalam	mpc clear; mpc ls fixed/A-Z_fixed | mpc add; mpc shuffle; mpc play
		Tamil	        mpc clear; mpc ls fixed/tamil_fixed | mpc add; mpc shuffle; mpc play
		Hindi	        mpc clear; mpc ls fixed/hindi_fixed | mpc add; mpc shuffle; mpc play

Bluetooth	blueman-applet
Caffeine	        caffeine
Sticky-Note	globonote

PCManFM-Qt	pcmanfm-qt
Actions
	Lock	        slock-wrapper.sh
	Suspend	        systemctl suspend
	Reboot	reboot
	Poweroff	poweroff

Refresh Wallpaper	setbg -s ~/Downloads/wallpapers
Hibernate	systemctl hibernate
EOF
