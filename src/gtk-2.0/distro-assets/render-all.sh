#! /bin/bash

DISTROS="distros.txt"

for distro in `cat $DISTROS`
do
  cd $distro
  bash render-assets-$distro.sh
  cd ..
done
