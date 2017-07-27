#! /bin/bash
DISTROS="distros.txt"
COMPILED_FOLDER="sass/compiled-css"
OUTPUT="Compiled-Compact"

# GTK2 #
DISTRO_FOLDER="src/gtk-2.0/distro-gtk-files"
ASSETS_FOLDER="src/gtk-2.0/distro-assets"
COMMON_ASSETS_FOLDER="src/gtk-2.0/common-assets"
COMMON_FOLDER="src/gtk-2.0/common-files-compact"
###

echo "Compiling and copying..."
for distro in `cat $DISTROS`; do
  if [ $distro = "ubuntu" ]; then
    # I never said I knew what I was doing
    cp src/unity/common/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Compact/unity
    cp src/unity/common/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Dark-Compact/unity
    cp src/unity/common/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Darker-Compact/unity
    cp src/unity/dark/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Dark-Compact/unity
    cp src/unity/dark/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Darker-Compact/unity
  fi
  if [ $distro = "ubuntu-alt" ]; then
    # def will fix
    cp src/unity-alt/common/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Compact/unity
    cp src/unity-alt/common/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Dark-Compact/unity
    cp src/unity-alt/common/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Darker-Compact/unity
    cp src/unity-alt/dark/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Dark-Compact/unity
    cp src/unity-alt/dark/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Darker-Compact/unity
  fi

  for variant in '','' '-light','-Light' '-opaque','-Dark'; do IFS=","; set -- $variant;
    sassc -t expanded src/gnome-shell/sass/$distro/gnome-shell-$distro${1}-compact.scss $OUTPUT/United-${distro^}-Compact/United-${distro^}${2}-Compact/gnome-shell/gnome-shell.css
    sassc -t expanded src/gtk-3.0/sass/$distro/gtk-$distro-compact.scss $OUTPUT/United-${distro^}-Compact/United-${distro^}-Compact/gtk-3.0/gtk.css
    sassc -t expanded src/gtk-3.0/sass/$distro/gtk-$distro-dark-compact.scss $OUTPUT/United-${distro^}-Compact/United-${distro^}-Compact/gtk-3.0/gtk-dark.css
    rm $OUTPUT/United-${distro^}-Compact/United-${distro^}-Compact/gtk-3.0/assets/* -R
    cp src/gtk-3.0/common-assets/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Compact/gtk-3.0/assets/ -R
    cp src/gtk-3.0/distro-assets/${distro}-assets/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Compact/gtk-3.0/assets/ -R
    cp src/metacity-1/light-assets/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Compact/metacity-1/
    cp src/metacity-1/common-files/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Compact/metacity-1/
    for buttons in '-minimize' '-maximize' '-close'; do
      cp src/gtk-3.0/distro-assets/${distro}-assets/titlebutton${buttons}-hover.png $OUTPUT/United-${distro^}-Compact/United-${distro^}-Compact/metacity-1/
      cp src/gtk-3.0/distro-assets/${distro}-assets/titlebutton${buttons}-active.png $OUTPUT/United-${distro^}-Compact/United-${distro^}-Compact/metacity-1/
    done
  done

  for variant in "" '-Dark'; do
    rm $OUTPUT/United-${distro^}-Compact/United-${distro^}${variant^}-Compact/gnome-shell/assets/* -R
    cp src/gnome-shell/common-assets/* $OUTPUT/United-${distro^}-Compact/United-${distro^}${variant^}-Compact/gnome-shell/assets/ -R
    cp src/gnome-shell/distro-assets/$distro-assets/* $OUTPUT/United-${distro^}-Compact/United-${distro^}${variant^}-Compact/gnome-shell/assets/ -R
  done

  for variant in '-Dark'; do
    sassc -t expanded src/gtk-3.0/sass/$distro/gtk-$distro-dark-compact.scss $OUTPUT/United-${distro^}-Compact/United-${distro^}-Dark-Compact/gtk-3.0/gtk.css
    rm $OUTPUT/United-${distro^}-Compact/United-${distro^}-Dark-Compact/gtk-3.0/assets/* -R
    cp src/gnome-shell/common-assets-dark/* $OUTPUT/United-${distro^}-Compact/United-${distro^}${variant^}-Compact/gnome-shell/assets/ -R
    cp src/gtk-3.0/common-assets/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Dark-Compact/gtk-3.0/assets/ -R
    for buttons in '-minimize' '-maximize' '-close'; do
      cp src/gtk-3.0/common-assets/titlebutton${buttons}-dark.png $OUTPUT/United-${distro^}-Compact/United-${distro^}-Dark-Compact/gtk-3.0/assets/
      cp src/gtk-3.0/distro-assets/${distro}-assets/titlebutton${buttons}-hover*.png $OUTPUT/United-${distro^}-Compact/United-${distro^}-Dark-Compact/gtk-3.0/assets/
      cp src/gtk-3.0/distro-assets/${distro}-assets/titlebutton${buttons}-active*.png $OUTPUT/United-${distro^}-Compact/United-${distro^}-Dark-Compact/gtk-3.0/assets/
      cp src/metacity-1/dark-assets/titlebutton${buttons}-dark.png $OUTPUT/United-${distro^}-Compact/United-${distro^}-Dark-Compact/metacity-1/
      cp src/metacity-1/dark-assets/titlebutton${buttons}-dark-backdrop.png $OUTPUT/United-${distro^}-Compact/United-${distro^}-Dark-Compact/metacity-1/
      cp src/gtk-3.0/distro-assets/${distro}-assets/titlebutton${buttons}-hover.png $OUTPUT/United-${distro^}-Compact/United-${distro^}-Dark-Compact/metacity-1/
      cp src/gtk-3.0/distro-assets/${distro}-assets/titlebutton${buttons}-active.png $OUTPUT/United-${distro^}-Compact/United-${distro^}-Dark-Compact/metacity-1/
    done
  done

  for variant in '-Darker'; do
    sassc -t expanded src/gtk-3.0/sass/$distro/gtk-$distro-darker-compact.scss $OUTPUT/United-${distro^}-Compact/United-${distro^}-Darker-Compact/gtk-3.0/gtk.css
    sassc -t expanded src/gtk-3.0/sass/$distro/gtk-$distro-dark-compact.scss $OUTPUT/United-${distro^}-Compact/United-${distro^}-Darker-Compact/gtk-3.0/gtk-dark.css
    rm $OUTPUT/United-${distro^}-Compact/United-${distro^}-Darker-Compact/gtk-3.0/assets/* -R
    cp src/gtk-3.0/common-assets/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Darker-Compact/gtk-3.0/assets/ -R
    cp src/gtk-3.0/distro-assets/$distro-assets/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Darker-Compact/gtk-3.0/assets/ -R
    for buttons in '-minimize' '-maximize' '-close'; do
      cp src/gtk-3.0/common-assets/titlebutton${buttons}-dark.png $OUTPUT/United-${distro^}-Compact/United-${distro^}-Darker-Compact/gtk-3.0/assets/
      cp src/gtk-3.0/distro-assets/${distro}-assets/titlebutton${buttons}-hover*.png $OUTPUT/United-${distro^}-Compact/United-${distro^}-Darker-Compact/gtk-3.0/assets/
      cp src/gtk-3.0/distro-assets/${distro}-assets/titlebutton${buttons}-active*.png $OUTPUT/United-${distro^}-Compact/United-${distro^}-Darker-Compact/gtk-3.0/assets/
      cp src/metacity-1/dark-assets/titlebutton${buttons}-dark.png $OUTPUT/United-${distro^}-Compact/United-${distro^}-Darker-Compact/metacity-1/
      cp src/metacity-1/dark-assets/titlebutton${buttons}-dark-backdrop.png $OUTPUT/United-${distro^}-Compact/United-${distro^}-Darker-Compact/metacity-1/
      cp src/gtk-3.0/distro-assets/${distro}-assets/titlebutton${buttons}-hover.png $OUTPUT/United-${distro^}-Compact/United-${distro^}-Darker-Compact/metacity-1/
      cp src/gtk-3.0/distro-assets/${distro}-assets/titlebutton${buttons}-active.png $OUTPUT/United-${distro^}-Compact/United-${distro^}-Darker-Compact/metacity-1/
    done
  done

  for variant in '-Light'; do
    cp src/gnome-shell/common-assets/* $OUTPUT/United-${distro^}-Compact/United-${distro^}${variant^}-Compact/gnome-shell/assets/ -R
    cp src/gnome-shell/common-assets-light/* $OUTPUT/United-${distro^}-Compact/United-${distro^}${variant^}-Compact/gnome-shell/assets/ -R
    cp src/gnome-shell/distro-assets/$distro-assets/* $OUTPUT/United-${distro^}-Compact/United-${distro^}${variant^}-Compact/gnome-shell/assets/ -R
  done

  for variant in 'dark'; do
    for file_name in 'Dark'; do
      cp ${DISTRO_FOLDER}/${distro}/gtkrc-${variant}-${distro} $OUTPUT/United-${distro^}-Compact/United-${distro^}-$file_name-Compact/gtk-2.0/gtkrc
      cp ${COMMON_FOLDER}/main.rc $OUTPUT/United-${distro^}-Compact/United-${distro^}-$file_name-Compact/gtk-2.0/main.rc
      cp ${COMMON_FOLDER}/hacks-dark.rc $OUTPUT/United-${distro^}-Compact/United-${distro^}-$file_name-Compact/gtk-2.0/hacks.rc
      rm $OUTPUT/United-${distro^}-Compact/United-${distro^}-$file_name-Compact/gtk-2.0/assets/*
      cp ${COMMON_ASSETS_FOLDER}-${variant}/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-$file_name-Compact/gtk-2.0/assets/
      cp ${ASSETS_FOLDER}/${distro}/${distro}-${variant}-assets/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-$file_name-Compact/gtk-2.0/assets/
    done
  done
  for variant in 'darker'; do
    for file_name in 'Darker'; do
      cp ${DISTRO_FOLDER}/${distro}/gtkrc-${variant}-${distro} $OUTPUT/United-${distro^}-Compact/United-${distro^}-$file_name-Compact/gtk-2.0/gtkrc
      cp ${COMMON_FOLDER}/main.rc $OUTPUT/United-${distro^}-Compact/United-${distro^}-$file_name-Compact/gtk-2.0/main.rc
      cp ${COMMON_FOLDER}/hacks.rc $OUTPUT/United-${distro^}-Compact/United-${distro^}-$file_name-Compact/gtk-2.0/hacks.rc
      rm $OUTPUT/United-${distro^}-Compact/United-${distro^}-$file_name-Compact/gtk-2.0/assets/*
      cp src/gtk-2.0/common-assets-light/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-$file_name-Compact/gtk-2.0/assets/
      cp ${ASSETS_FOLDER}/${distro}/${distro}-light-assets/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-$file_name-Compact/gtk-2.0/assets/
    done
  done
  for variant in 'light'; do
    cp ${DISTRO_FOLDER}/${distro}/gtkrc-${distro} $OUTPUT/United-${distro^}-Compact/United-${distro^}-Compact/gtk-2.0/gtkrc
    cp ${COMMON_FOLDER}/main.rc $OUTPUT/United-${distro^}-Compact/United-${distro^}-Compact/gtk-2.0/main.rc
    cp ${COMMON_FOLDER}/hacks.rc $OUTPUT/United-${distro^}-Compact/United-${distro^}-Compact/gtk-2.0/hacks.rc
    rm $OUTPUT/United-${distro^}-Compact/United-${distro^}-Compact/gtk-2.0/assets/*
    cp ${COMMON_ASSETS_FOLDER}-${variant}/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Compact/gtk-2.0/assets/
    cp ${ASSETS_FOLDER}/${distro}/${distro}-${variant}-assets/* $OUTPUT/United-${distro^}-Compact/United-${distro^}-Compact/gtk-2.0/assets/
  done
done
