#! /bin/bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"
DISTROS="../../../distros.txt"
INDEX="assets.txt"

for distro in `cat $DISTROS `; do
    ASSETS_DIR="$distro/$distro-light-assets"
    DARK_ASSETS_DIR="$distro/$distro-dark-assets"
	  rm $ASSETS_DIR/*
	  rm $DARK_ASSETS_DIR/*
done
for distro in `cat $DISTROS`; do
  for i in `cat $INDEX`; do
    SRC_FILE="$distro/$distro-light-assets.svg"
    ASSETS_DIR="$distro/$distro-light-assets"
    DARK_SRC_FILE="$distro/$distro-dark-assets.svg"
    DARK_ASSETS_DIR="$distro/$distro-dark-assets"
    if [ -f $ASSETS_DIR/$i.png ]; then
      echo $ASSETS_DIR/$i.png exists.
    else
      echo
      echo Rendering $ASSETS_DIR/$i.png
      $INKSCAPE --export-id=$i \
      --export-id-only \
      --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png
    fi
    if [ -f $DARK_ASSETS_DIR/$i.png ]; then
      echo $DARK_ASSETS_DIR/$i.png exists.
    else
      echo
      echo Rendering $DARK_ASSETS_DIR/$i.png
      $INKSCAPE --export-id=$i \
      --export-id-only \
      --export-png=$DARK_ASSETS_DIR/$i.png $DARK_SRC_FILE >/dev/null \
      && $OPTIPNG -o7 --quiet $DARK_ASSETS_DIR/$i.png
    fi
  done
done
exit 0
