#! /bin/bash
DISTROS="../../../distros.txt"
COMPILED_FOLDER="sass/compiled-css"
OUTPUT="Compiled"
###

echo "Compiling and copying..."
for distro in `cat $DISTROS`; do
  rm ${distro}-assets/*
  bash render-assets-${distro}.sh
done
rm common-assets/*
bash render-common-assets.sh
exit
