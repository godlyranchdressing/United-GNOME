#! /bin/bash
DISTROS="distros.txt"

echo "Compressing..."

for distro in `cat $DISTROS`; do
  for variants in '' '-Light' '-Dark' '-Darker'; do
    cd Compiled
    cd United-${distro^}
    tar -cvzf United-${distro^}.tar.gz United-${distro^} United-${distro^}-Light United-${distro^}-Darker United-${distro^}-Dark
    mv United-${distro^}.tar.gz ../..
    cd ..
  done
done

cd ..
mv United-Opensuse.tar.gz United-OpenSUSE.tar.gz
mv United-Ubuntu.tar.gz United-Latest.tar.gz
