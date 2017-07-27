#! /bin/bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"
DISTROS="../../../distros.txt"
INDEX="assets.txt"

for distro in `cat $DISTROS`; do
  for i in `cat $INDEX`; do
    SRC_FILE="source-files/${distro}-assets.svg"
    ASSETS_DIR="${distro}-assets"
    if [ -f $ASSETS_DIR/$i.png ]; then
      echo $ASSETS_DIR/$i.png exists.
    else
      echo
      echo Rendering $ASSETS_DIR/$i.png
      $INKSCAPE --export-id=$i \
      --export-dpi=96 \
      --export-id-only \
      --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png
    fi
    if [ -f $ASSETS_DIR/$i@2.png ]; then
      echo $ASSETS_DIR/$i@2.png exists.
    else
      echo
      echo Rendering $ASSETS_DIR/$i@2.png
      $INKSCAPE --export-id=$i \
      --export-dpi=180 \
      --export-id-only \
      --export-png=$ASSETS_DIR/$i@2.png $SRC_FILE >/dev/null \
      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i@2.png
    fi
  done
done
exit 0
