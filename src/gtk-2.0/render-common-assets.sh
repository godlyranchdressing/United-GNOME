#! /bin/bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

SRC_FILE="common-light-assets.svg"
ASSETS_DIR="common-assets-light"

DARK_SRC_FILE="common-dark-assets.svg"
DARK_ASSETS_DIR="common-assets-dark"

CR_SRC_FILE="checks-radios.svg"
CR_ASSETS_DIR="checks-radios"
CR_INDEX="checks-radios.txt"

INDEX="common-assets.txt"

for i in `cat $INDEX`
do
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

for i in `cat $CR_INDEX`
do
  if [ -f $CR_ASSETS_DIR/$i.png ]; then
    echo $CR_ASSETS_DIR/$i.png exists.
  else
    echo
    echo Rendering $CR_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
    --export-id-only \
    --export-png=$CR_ASSETS_DIR/$i.png $CR_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $CR_ASSETS_DIR/$i.png
  fi
done
exit 0
