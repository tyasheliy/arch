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

# Если не внутри tmux
if [[ -z $TMUX ]]; then
    # Пытаемся присоединиться или создать сессию
    tmux new -A -s "$selected_name" -c "$selected"
else
    # Если внутри tmux - создаем сессию если нужно и переключаемся
    if ! tmux has-session -t="$selected_name" 2>/dev/null; then
        tmux new-session -ds "$selected_name" -c "$selected"
    fi
    tmux switch-client -t "$selected_name"
fi
