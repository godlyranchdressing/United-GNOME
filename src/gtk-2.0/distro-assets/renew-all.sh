#! /bin/bash

DISTROS="../../../distros.txt"

for distro in `cat $DISTROS`
do
  cd $distro
  rm $distro-dark-assets/*
  rm $distro-light-assets/*
  bash render-assets-$distro.sh
  cd ..
done
