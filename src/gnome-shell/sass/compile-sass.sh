#! /bin/bash

DISTROS="distros.txt"
COMPILED_FOLDER="compiled-css/"

for distro in `cat $DISTROS`
do
sassc -t expanded ${distro}/gnome-shell-${distro}.scss $COMPILED_FOLDER/$distro/gnome-shell-${distro}.css
  for type in '-light' '-opaque'; do
sassc -t expanded ${distro}/gnome-shell-${distro}${type}.scss $COMPILED_FOLDER/$distro/gnome-shell-${distro}${type}.css
  done
done
