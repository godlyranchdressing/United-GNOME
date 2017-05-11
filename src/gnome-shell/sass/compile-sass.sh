#! /bin/bash

DISTROS="distros.txt"
COMPILED_FOLDER="./compiled-css/"

for distro in `cat $DISTROS`
do
  sassc -t expanded ${distro}/gnome-shell-${distro}.scss $COMPILED_FOLDER/$distro/gnome-shell-${distro}.css
  for type in '-light' '-opaque'; do
    sassc -t expanded ${distro}/gnome-shell-${distro}${type}.scss $COMPILED_FOLDER/$distro/gnome-shell-${distro}${type}.css
  done
done
for color in '-orange' '-blue' '-green'; do
  sassc -t expanded agnostic/gnome-shell-agnostic${color}.scss $COMPILED_FOLDER/agnostic$color/gnome-shell-agnostic${color}.css
  for type in '-light' '-opaque'; do
    sassc -t expanded agnostic/gnome-shell-agnostic${color}${type}.scss $COMPILED_FOLDER/agnostic$color/gnome-shell-agnostic${color}${type}.css
  done
done
