#! /bin/bash

DISTROS="distros.txt"
COMPILED_FOLDER="compiled-css"

for distro in `cat $DISTROS`
do
  sassc -t expanded ${distro}/gtk-${distro}.scss $COMPILED_FOLDER/$distro/gtk-${distro}.css
  for type in '-dark' '-darker'; do
  sassc -t expanded ${distro}/gtk-${distro}${type}.scss $COMPILED_FOLDER/$distro/gtk-${distro}${type}.css
  done
done
exit
