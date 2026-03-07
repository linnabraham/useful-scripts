#!/bin/sh

cat <<EOF | xmenu | sh &
Apps
	PCManFM-Qt	pcmanfm-qt
	Brave	brave
	Amplenote	gtk-launch brave-pfphgelppkenhllngngioolkaeelhlmi-Default
	Picard	picard
	PuddleTag	puddletag
	Zotero	gtk-launch zotero
	Terminal	xfce4-terminal
	Music Player	wrapper-wmctrl.sh start-plattenalbum
	Telegram	telegram-desktop
	Whatsapp	zapzap
Music
	Recent	mpc-add-recent.sh
	Random	mpc clear; mpc ls fixed/ | mpc add; mpc shuffle; mpc play
	Language
		English	        mpc clear; mpc ls fixed/eng_fixed | mpc add; mpc shuffle; mpc play
		Malayalam	mpc clear; mpc ls fixed/A-Z_fixed | mpc add; mpc shuffle; mpc play
		Tamil	        mpc clear; mpc ls fixed/tamil_fixed | mpc add; mpc shuffle; mpc play
		Hindi	        mpc clear; mpc ls fixed/hindi_fixed | mpc add; mpc shuffle; mpc play

Bluetooth	blueman-applet
Caffeine	        caffeine
Sticky-Note	globonote

Refresh Wallpaper	setbg -s ~/Downloads/wallpapers
Lock	        slock-wrapper.sh

Actions
	Suspend	        systemctl suspend
	Reboot	reboot
	Hibernate	systemctl hibernate
	Poweroff	poweroff
EOF
