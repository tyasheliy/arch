#!/bin/bash

# ignore errors of already installed snaps.
set +e

function i {
	sudo snap install $1
}

i telegram-desktop
i ticktick
i postman
i dbeaver-ce
i firefox
