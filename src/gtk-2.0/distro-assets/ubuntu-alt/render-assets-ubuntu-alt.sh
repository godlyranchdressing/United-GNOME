#! /bin/bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

SRC_FILE="ubuntu-alt-light-assets.svg"
ASSETS_DIR="ubuntu-alt-light-assets"

DARK_SRC_FILE="ubuntu-alt-dark-assets.svg"
DARK_ASSETS_DIR="ubuntu-alt-dark-assets"

INDEX="../assets.txt"

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
exit 0
