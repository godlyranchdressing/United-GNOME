#! /bin/bash

DISTROS="distros.txt"
DISTRO_FOLDER="src/gtk-2.0/distro-files"
ASSETS_FOLDER="src/gtk-2.0/distro-assets"
COMMON_FOLDER="src/gtk-2.0/common-files"

for distro in `cat $DISTROS`; do
  for variant in 'dark'; do
    for file_name in 'Dark'; do
      cp ${DISTRO_FOLDER}/${distro}/gtkrc-${variant}-${distro} Compiled/United-${distro^}/United-${distro^}-$file_name/gtk-2.0/gtkrc
      cp ${COMMON_FOLDER}/main.rc Compiled/United-${distro^}/United-${distro^}-$file_name/gtk-2.0/main.rc
      cp ${ASSETS_FOLDER}/${distro}/${distro}-${variant}-assets/* Compiled/United-${distro^}/United-${distro^}-$file_name/gtk-2.0/assets/
    done
  done
    for variant in 'darker'; do
      for file_name in 'Darker'; do
        cp ${DISTRO_FOLDER}/${distro}/gtkrc-${variant}-${distro} Compiled/United-${distro^}/United-${distro^}-$file_name/gtk-2.0/gtkrc
        cp ${COMMON_FOLDER}/main.rc Compiled/United-${distro^}/United-${distro^}-$file_name/gtk-2.0/main.rc
        cp ${ASSETS_FOLDER}/${distro}/${distro}-light-assets/* Compiled/United-${distro^}/United-${distro^}-$file_name/gtk-2.0/assets/
    done
  done
    for variant in 'light'; do
      cp ${DISTRO_FOLDER}/${distro}/gtkrc-${distro} Compiled/United-${distro^}/United-${distro^}/gtk-2.0/gtkrc
      cp ${COMMON_FOLDER}/main.rc Compiled/United-${distro^}/United-${distro^}/gtk-2.0/main.rc
      cp ${ASSETS_FOLDER}/${distro}/${distro}-${variant}-assets/* Compiled/United-${distro^}/United-${distro^}/gtk-2.0/assets/
  done
done
