#! /bin/bash
DISTROS="distros.txt"
COMPILED_FOLDER="sass/compiled-css"
OUTPUT="Compiled"
###

echo "Compiling and copying..."
for distro in `cat $DISTROS`; do
  for variant in '','' '-light','-Light' '-opaque','-Dark'; do IFS=","; set -- $variant;
    sassc -t expanded src/gnome-shell/sass/$distro/gnome-shell-$distro${1}.scss $OUTPUT/United-${distro^}/United-${distro^}${2}/gnome-shell/gnome-shell.css
    sassc -t expanded src/gtk-3.0/sass/$distro/gtk-$distro.scss $OUTPUT/United-${distro^}/United-${distro^}/gtk-3.0/gtk.css
    sassc -t expanded src/gtk-3.0/sass/$distro/gtk-$distro-dark.scss $OUTPUT/United-${distro^}/United-${distro^}/gtk-3.0/gtk-dark.css
    rm $OUTPUT/United-${distro^}/United-${distro^}/gtk-3.0/assets/* -R
    cp src/gtk-3.0/distro-assets/common-assets/* $OUTPUT/United-${distro^}/United-${distro^}/gtk-3.0/assets/ -R
    cp src/gtk-3.0/distro-assets/${distro}-assets/* $OUTPUT/United-${distro^}/United-${distro^}/gtk-3.0/assets/ -R
  done

  for variant in "" '-Dark'; do
    rm $OUTPUT/United-${distro^}/United-${distro^}${variant^}/gnome-shell/assets/* -R
    cp src/gnome-shell/common-assets/* $OUTPUT/United-${distro^}/United-${distro^}${variant^}/gnome-shell/assets/ -R
    cp src/gnome-shell/distro-assets/$distro-assets/* $OUTPUT/United-${distro^}/United-${distro^}${variant^}/gnome-shell/assets/ -R
  done

  for variant in '-Dark'; do
    sassc -t expanded src/gtk-3.0/sass/$distro/gtk-$distro-dark.scss $OUTPUT/United-${distro^}/United-${distro^}-Dark/gtk-3.0/gtk.css
    rm $OUTPUT/United-${distro^}/United-${distro^}-Dark/gtk-3.0/assets/* -R
    cp src/gtk-3.0/distro-assets/common-assets/*dark* $OUTPUT/United-${distro^}/United-${distro^}-Dark/gtk-3.0/assets/ -R
    cp src/gtk-3.0/distro-assets/$distro-assets/*dark* $OUTPUT/United-${distro^}/United-${distro^}-Dark/gtk-3.0/assets/ -R
  done

  for variant in '-Darker'; do
    sassc -t expanded src/gtk-3.0/sass/$distro/gtk-$distro-darker.scss $OUTPUT/United-${distro^}/United-${distro^}-Darker/gtk-3.0/gtk.css
    sassc -t expanded src/gtk-3.0/sass/$distro/gtk-$distro-dark.scss $OUTPUT/United-${distro^}/United-${distro^}-Darker/gtk-3.0/gtk-dark.css
    rm $OUTPUT/United-${distro^}/United-${distro^}-Darker/gtk-3.0/assets/* -R
    cp src/gtk-3.0/distro-assets/common-assets/* $OUTPUT/United-${distro^}/United-${distro^}-Darker/gtk-3.0/assets/ -R
    cp src/gtk-3.0/distro-assets/$distro-assets/* $OUTPUT/United-${distro^}/United-${distro^}-Darker/gtk-3.0/assets/ -R
    mkdir $OUTPUT/United-${distro^}/United-${distro^}-Darker/gtk-3.0/assets/working && mv $OUTPUT/United-${distro^}/United-${distro^}-Darker/gtk-3.0/assets/titlebutton* $OUTPUT/United-${distro^}/United-${distro^}-Darker/gtk-3.0/assets/working && mv $OUTPUT/United-${distro^}/United-${distro^}-Darker/gtk-3.0/assets/working/*dark* $OUTPUT/United-${distro^}/United-${distro^}-Darker/gtk-3.0/assets/ && rm $OUTPUT/United-${distro^}/United-${distro^}-Darker/gtk-3.0/assets/working -R
  done

  for variant in '-Light'; do
    cp src/gnome-shell/common-assets/* $OUTPUT/United-${distro^}/United-${distro^}${variant^}/gnome-shell/assets/ -R
    cp src/gnome-shell/common-assets-light/* $OUTPUT/United-${distro^}/United-${distro^}${variant^}/gnome-shell/assets/ -R
    cp src/gnome-shell/distro-assets/$distro-assets/* $OUTPUT/United-${distro^}/United-${distro^}${variant^}/gnome-shell/assets/ -R
  done
done
