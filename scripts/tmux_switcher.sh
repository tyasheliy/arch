#!/bin/bash

if [[ $# -eq 2 ]]; then
    selected=$2
else
    projects=$(find ~/projects -mindepth 1 -maxdepth 1 -type d)
	added="$HOME/os\n$HOME/org"
	selected=$(echo -e "${projects}\n${added}" | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)

create_vanilla_tmux_session() {
	if [[ -z $TMUX ]]; then
		tmux new -A -s "$selected_name" -c "$selected"
	else
		if ! tmux has-session -t="$selected_name" 2>/dev/null; then
			tmux new-session -ds "$selected_name" -c "$selected"
		fi
		tmux switch-client -t "$selected_name"
	fi
}

(cd $selected && tmuxp load -y "$selected" > /dev/null 2>&1) || create_vanilla_tmux_session
