#!/bin/bash

output="$CALLER_DIR/.tmuxp.yml"

(
	cd $CALLER_DIR && \
	output=$output $SHELL -c 'tmuxp freeze -f yaml -o "$output" -y --force' && \
	sed -i -e "s@start_directory\: /home/tyasheliy/os/scripts@start_directory: $CALLER_DIR@g" "$output" && \
	sed -i -e "s@bash@clear@g" "$output"
)
