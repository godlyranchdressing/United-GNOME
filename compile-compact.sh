#! /bin/bash
THEME="United"
SIZE="-Compact"
VARIANTS="distros.txt"

for distro in `cat $VARIANTS`; do
  echo "Working on ${distro^}$SIZE"
  if [[ "$distro" = "ubuntu" ]] || [[ "$distro" = "ubuntu-alt" ]]; then
    ##### Unity #####
    for variant in '' '-Dark' '-Darker'; do
      INPUT=src/unity
      OUTPUT=Compiled$SIZE/$THEME-${distro^}$SIZE/$THEME-${distro^}$variant$SIZE/

      cp $INPUT/ubuntu-assets/* $OUTPUT/unity
      cp $INPUT/common-assets/* $OUTPUT/unity

      if [ "$variant" = "-Dark" ] || [ "$variant" = "-Darker" ]; then
        cp $INPUT/common-dark-assets/* $OUTPUT/unity
      fi
    done
  fi

  for variant in "","" "-opaque","-Dark" "-light","-Light"; do IFS=","; set -- $variant;
    ##### Shell #####
    SASS=src/gnome-shell/sass/$distro
    INPUT=src/gnome-shell
    OUTPUT=Compiled$SIZE/$THEME-${distro^}$SIZE/$THEME-${distro^}$2$SIZE/gnome-shell

    cp $INPUT/common-assets/* $OUTPUT/assets/ -R
    cp $INPUT/distro-assets/$distro/* $OUTPUT/assets/ -R
    sassc -t expanded $SASS/gnome-shell-$distro$1${SIZE,,}.scss $OUTPUT/gnome-shell.css

    if [[ "$2" = "-Dark" ]]; then
      cp src/gnome-shell/common-assets-dark/* $OUTPUT/assets/ -R
    elif [[ "$2" = "-Light" ]]; then
      cp src/gnome-shell/common-assets-light/* $OUTPUT/assets/ -R
    fi
  done

  for variant in "","" "-dark","-Dark" "-darker","-Darker"; do IFS=","; set -- $variant;
    ##### GTK3 #####
    SASS=src/gtk-3.0/sass/$distro
    INPUT=src/gtk-3.0
    OUTPUT=Compiled$SIZE/$THEME-${distro^}$SIZE/$THEME-${distro^}$2$SIZE/gtk-3.0

    rm $OUTPUT/assets/*
    cp $INPUT/common-assets/checkboxes-common/* $OUTPUT/assets/
    cp $INPUT/common-assets/symbolic-icons/* $OUTPUT/assets/
    cp $INPUT/common-assets/checkboxes-dark/* $OUTPUT/assets/
    cp $INPUT/distro-assets/$distro/* $OUTPUT/assets/
    sassc -t expanded $SASS/gtk-$distro$1${SIZE,,}.scss $OUTPUT/gtk.css

    if [[ "$2" = "" ]] || [[ "$2" = "-Darker" ]]; then
      sassc -t expanded $SASS/gtk-$distro-dark${SIZE,,}.scss $OUTPUT/gtk-dark.css
      cp $INPUT/common-assets/checkboxes/* $OUTPUT/assets/
    fi

    if [[ "$1" = "" ]]; then
      cp $INPUT/common-assets/window-buttons/* $OUTPUT/assets
    elif [[ "$2" = "-Dark" ]] || [[ "$2" = "-Darker" ]]; then
      cp $INPUT/common-assets/window-buttons-dark/* $OUTPUT/assets
    fi
  done

  for variant in "","" "-dark","-Dark" "-darker","-Darker"; do IFS=","; set -- $variant;
    ##### Metacity #####
    INPUT=src/metacity-1
    OUTPUT=Compiled$SIZE/$THEME-${distro^}$SIZE/$THEME-${distro^}$2$SIZE/metacity-1
    rm $OUTPUT/*
    cp $INPUT/common-files/* $OUTPUT

    if [[ "$1" = "" ]]; then
      cp $INPUT/common-light-assets/* $OUTPUT
    elif [[ "$2" = "-Dark" ]] || [[ "$2" = "-Darker" ]]; then
      cp $INPUT/common-dark-assets/* $OUTPUT
    fi
  done

  for variant in "","" "-dark","-Dark" "-darker","-Darker"; do IFS=","; set -- $variant;
    ##### GTK2 #####
    GTK=src/gtk-2.0/distro-gtk-files/$distro
    COMMON=src/gtk-2.0/common-files${SIZE,,}
    INPUT=src/gtk-2.0
    OUTPUT=Compiled$SIZE/$THEME-${distro^}$SIZE/$THEME-${distro^}$2$SIZE/gtk-2.0
    rm $OUTPUT/assets/* -R
    cp $GTK/gtkrc-$distro$1 $OUTPUT/gtkrc
    cp $COMMON/hacks.rc $OUTPUT/hacks.rc
    cp $COMMON/main.rc $OUTPUT/main.rc

    if [[ "$2" != "-Dark" ]]; then
      cp $INPUT/common-assets-light/* $OUTPUT/assets/ -R
      cp $INPUT/distro-assets/$distro/$distro-light-assets/* $OUTPUT/assets/
    else
      cp $COMMON//hacks-dark.rc $OUTPUT
      cp $INPUT/common-assets-dark/* $OUTPUT/assets/ -R
      cp $INPUT/distro-assets/$distro/$distro-dark-assets/* $OUTPUT/assets/
    fi
  done
done

echo "Done!"
