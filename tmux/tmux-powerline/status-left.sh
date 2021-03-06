#!/usr/bin/env bash
#Print the status-left for tmux.
#
# The powerline root directory.
cwd=$(dirname $0)

# Source global configurations.
source "${cwd}/config.sh"

# Source lib functions.
source "${cwd}/lib.sh"

segments_path="${cwd}/${segments_dir}"

# Segments

declare -A tmux_session_info
tmux_session_info+=(["script"]="${segments_path}/tmux_session_info.sh")
tmux_session_info+=(["foreground"]="colour245")
tmux_session_info+=(["background"]="colour233")
tmux_session_info+=(["separator"]="${separator_right_thin}")
tmux_session_info+=(["separator_fg"]="default")
register_segment "tmux_session_info"

declare -A hostname
hostname+=(["script"]="${segments_path}/hostname.sh")
hostname+=(["foreground"]="colour245")
hostname+=(["background"]="colour233")
hostname+=(["separator"]="${separator_right_thin}")
hostname+=(["separator_fg"]="colour245")
register_segment "hostname"

# declare -A lan_ip
# lan_ip+=(["script"]="${segments_path}/lan_ip.sh")
# lan_ip+=(["foreground"]="colour245")
# lan_ip+=(["background"]="colour233")
# hostname+=(["separator"]="${separator_right_thin}")
# hostname+=(["separator_fg"]="colour245")
# register_segment "lan_ip"

# declare -A wan_ip
# wan_ip+=(["script"]="${segments_path}/wan_ip.sh")
# wan_ip+=(["foreground"]="colour255")
# wan_ip+=(["background"]="colour24")
# wan_ip+=(["separator"]="${separator_right_bold}")
# register_segment "wan_ip"

# declare -A vcs_branch
# vcs_branch+=(["script"]="${segments_path}/vcs_branch.sh")
# vcs_branch+=(["foreground"]="colour2338")
# vcs_branch+=(["background"]="colour29")
# vcs_branch+=(["separator"]="${separator_right_bold}")
# register_segment "vcs_branch"

# Print the status line in the order of registration above.
print_status_line_left

exit 0
