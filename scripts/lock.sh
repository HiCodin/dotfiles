#!/bin/bash

#depends on: imagemagick, i3lock, scrot

scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
convert $HOME/Pictures/Icons/punch.png /tmp/lock-icon.png
convert /tmp/screen.png /tmp/lock-icon.png -gravity center -composite -matte /tmp/screen.png
i3lock -u -i /tmp/screen.png
rm /tmp/screen.png
