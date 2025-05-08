#!/bin/sh

# This script provides fzf interface for executing bash scripts in ./scripts dir.

execute () {
	cd $SCRIPT_DIR && bash $1
	exit 0
}

if [ $# -eq 0 ]; then
	selected=$(ls $SCRIPT_DIR | grep .sh | fzf)

	if [ -z "${selected}" ]; then
		exit 0
	fi

	execute $selected
fi

execute $1
