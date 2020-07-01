#!/bin/bash

# dock settings
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 35

gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']" # replace caps with ctrl
