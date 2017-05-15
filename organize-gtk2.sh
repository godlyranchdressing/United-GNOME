#! /bin/bash

DISTROS="distros.txt"
DISTRO_FOLDER="./gtk2/distro-files"
ASSETS_FOLDER="./gtk2/distro-assets"
COMMON_FOLDER="./gtk2/common-files"

for distro in `cat $DISTROS`; do
  for variant in 'dark'; do
    for file_name in 'Dark'; do
      cp ${DISTRO_FOLDER}/${distro}/gtkrc-${variant}-${distro} United-${distro^}/United-${distro^}-$file_name/gtk-2.0/gtkrc
      cp ${COMMON_FOLDER}/main.rc United-${distro^}/United-${distro^}-$file_name/gtk-2.0/main.rc
      cp ${COMMON_FOLDER}/apps.rc United-${distro^}/United-${distro^}-$file_name/gtk-2.0/apps.rc
      cp ${ASSETS_FOLDER}/${distro}/${distro}-${variant}-assets/* United-${distro^}/United-${distro^}-$file_name/gtk-2.0/assets/
    done
  done
  for distro in `cat $DISTROS`; do
    for variant in 'darker'; do
      for file_name in 'Darker'; do
        cp ${DISTRO_FOLDER}/${distro}/gtkrc-${variant}-${distro} United-${distro^}/United-${distro^}-$file_name/gtk-2.0/gtkrc
        cp ${COMMON_FOLDER}/main-${variant}.rc United-${distro^}/United-${distro^}-$file_name/gtk-2.0/main.rc
        cp ${COMMON_FOLDER}/apps.rc United-${distro^}/United-${distro^}-$file_name/gtk-2.0/apps.rc
        cp ${ASSETS_FOLDER}/${distro}/${distro}-light-assets/* United-${distro^}/United-${distro^}-$file_name/gtk-2.0/assets/
      done
    done
  done
  for distro in `cat $DISTROS`; do
    for variant in 'light'; do
      cp ${DISTRO_FOLDER}/${distro}/gtkrc-${variant}-${distro} United-${distro^}/United-${distro^}/gtk-2.0/gtkrc
      cp ${COMMON_FOLDER}/main.rc United-${distro^}/United-${distro^}/gtk-2.0/main.rc
      cp ${COMMON_FOLDER}/apps.rc United-${distro^}/United-${distro^}/gtk-2.0/apps.rc
      cp ${ASSETS_FOLDER}/${distro}/${distro}-${variant}-assets/* United-${distro^}/United-${distro^}/gtk-2.0/assets/
    done
  done
done
