#!/usr/bin/env bash
# This script prints a string will be evaluated for text attributes (but not shell commands) by tmux. It consists of a bunch of segments that are simple shell scripts/programs that output the information to show. For each segment the desired foreground and background color can be specified as well as what separator to use. The script the glues together these segments dynamically so that if one script suddenly does not output anything (= nothing should be shown) the separator colors will be nicely handled.

# The powerline root directory.
cwd=$(dirname $0)

# Source global configurations.
source "${cwd}/config.sh"

# Source lib functions.
source "${cwd}/lib.sh"

segments_path="${cwd}/${segments_dir}"

# Segment
# Comment/uncomment the register function call to enable or disable a segment.

declare -A pwd
pwd+=(["script"]="${segments_path}/pwd.sh")
pwd+=(["foreground"]="colour211")
pwd+=(["background"]="colour233")
pwd+=(["separator"]="${separator_left_bold}")
# register_segment "pwd"

declare -A now_playing
if [ "$PLATFORM" == "linux" ]; then
	now_playing+=(["script"]="${segments_path}/np_mpd.sh")
	#now_playing+=(["script"]="${segments_path}/np_spotify_linux_wine.sh")
	#now_playing+=(["script"]="${segments_path}/np_spotify_linux_native.sh")
	#now_playing+=(["script"]="${segments_path}/np_rhythmbox.sh")
	#now_playing+=(["script"]="${segments_path}/np_banshee.sh")
	#now_playing+=(["script"]="${segments_path}/np_audacious.sh")
elif [ "$PLATFORM" == "mac" ]; then
	now_playing+=(["script"]="${segments_path}/np_spotify_mac.sh")
fi
if [[ ${now_playing["script"]} ]]; then
	now_playing+=(["foreground"]="colour244")
	now_playing+=(["background"]="colour233")
	register_segment "now_playing"
fi

declare -A cpu
cpu+=(["script"]="${segments_path}/cpu.sh")
cpu+=(["foreground"]="colour245")
cpu+=(["background"]="colour240")
cpu+=(["separator"]="${separator_left_bold}")
#register_segment "cpu"

declare -A load
load+=(["script"]="${segments_path}/load.sh")
load+=(["foreground"]="colour167")
load+=(["background"]="colour237")
load+=(["separator"]="${separator_left_bold}")
#register_segment "load"

declare -A battery
if [ "$PLATFORM" == "mac" ]; then
	battery+=(["script"]="${segments_path}/battery_mac.sh")
else
	battery+=(["script"]="${segments_path}/battery.sh")
fi
battery+=(["foreground"]="colour245")
battery+=(["background"]="colour233")
register_segment "battery"

declare -A date_day
date_day+=(["script"]="${segments_path}/date_day.sh")
date_day+=(["foreground"]="colour245")
date_day+=(["background"]="colour233")
register_segment "date_day"

declare -A date_full
date_full+=(["script"]="${segments_path}/date_full.sh")
date_full+=(["foreground"]="colour245")
date_full+=(["background"]="colour233")
date_full+=(["separator"]="${separator_left_thin}")
date_full+=(["separator_fg"]="colour245")
register_segment "date_full"

declare -A time
time+=(["script"]="${segments_path}/time.sh")
time+=(["foreground"]="colour245")
time+=(["background"]="colour233")
time+=(["separator"]="${separator_left_thin}")
time+=(["separator_fg"]="colour245")
register_segment "time"

# Print the status line in the order of registration above.
print_status_line_right

exit 0
