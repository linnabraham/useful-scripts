# README

This is a repository of scripts that I frequently use on Linux.

## Scripts

The root directory contains the following scripts:

- `bukuadd`  - Script for saving url from any browser to my `buku` database.
- `bukumenu` - Script for pulling up a searchable dmenu interface for my browser independent bookmarks.
- `blurlock.sh` - Script for applying a gaussian blur to your current screen and make it the lock screen.
- `lfub`     - Wrapper script to open LF file manager with Ueberzug support.
- `rotdir`   - LukeSmith's script for rotating all images in a directory when using `sxiv`.
- `rofi-screenshot` - Adapted script for taking screenshots or screenrecording using `ffmpeg` 
- `setbg`    - LukeSmith's handy script for setting wallpapers using `xwallpaper`.
- `mail-notify.sh` - A wrapper script around the `checkmail` command to run in the background and alert when mail arrives.
- `sysact`   - LukeSmith's wrapper script for performing system actions like poweroff suspend exiting the WM etc.
- `musiclogger` - Script for logging music that I explicitly play with `mpd` to a csv file.
- `kp`       - A script for quickly killing running processes with the help of process name and `fzf`.
- `change-backlight.py` - Adapted script for changing display brightness in logarithmic steps and also set a lower limit.
- `pdfunlock`- A small script for replacing a secured pdf with its unlocked version using user provided password.
- `openbox-screenshot.sh` - Script that is bound to my PrintScr key to capture the entire screen to image and also to clipboard.
- `maimpick` - LukeSmith's wrapper script for using the `maim` utility for taking screenshots with `dmenu`.
- `trello-cmd` - Script for working with Trello from the command line. A few of the functions require `trello` command from the trello-cli.
- `battery-lev.sh` - Script to run in the background and alert about low battery. Useful if mostly working in full screen mode.
- `mpc_control` - Script for controlling music (with mpc)  using dmenu interface 

### Experimental
I have kept some scripts in the `experimental` folder since they are not production ready :-D.

- `notifier_calendar`: Script used to display calendar notifications
- `active-time`: Script used for displaying my daily computer usage time in polybar

### Device-specific scripts
Some scripts have hard-coded filepaths that are meant to be used on one particular machine. I have segregated them for the time being until I can make it device agnostic.

I have the `experimental/arch-thinkpad`, where I have the following files:

- `mpc-add-recent.sh`: Add the music files that I have added or modified in the last 30 days to my current mpd queue.

In the `experimental/arch-hp/` directory I have the following scripts:

- `mpc-add-recent.sh`: Same function as the other one
## Setup

- To setup the `bing-rotate.sh` script to automatically download the bing wallpaper of the day, everyday copy the included template files to your 
`/etc/systemd/user/` and run the following commands
```
systemctl --user enable bingwall.timer
systemctl --user start bingwall.timer
```
