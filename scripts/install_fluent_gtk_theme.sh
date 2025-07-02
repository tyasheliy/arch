#!/bin/bash

REPO_DIR=/tmp/fluent_gtk_src
DEST_DIR="$HOME/.themes"
THEME_DEST="$DEST_DIR/Fluent-Dark"
THEME_NAME="fluent-gtk"

if [[ -d $THEME_DEST ]]; then
	echo "Theme already installed"
	exit 0
fi

git clone https://github.com/vinceliuice/Fluent-gtk-theme $REPO_DIR

$REPO_DIR/install.sh \
	-d $DEST_DIR \
	-n $THEME_NAME \
	-s standard \
	-c dark \
	-l \
	--tweaks solid square

rm -rf $REPO_DIR
