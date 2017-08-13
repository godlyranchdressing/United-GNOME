#! /bin/bash
DISTROS="../distros.txt"
SIZE=""

cd Compiled$SIZE
for distro in `cat $DISTROS`; do
  echo "Compressing ${distro^}"
  cd United-${distro^}$SIZE
  cp ../../src/index.theme United-${distro^}$SIZE
  cp ../../src/index.theme United-${distro^}-Dark$SIZE
  cp ../../src/index.theme United-${distro^}-Darker$SIZE
  tar -czf United-${distro^}$SIZE.tar.gz United-${distro^}$SIZE United-${distro^}-Light$SIZE United-${distro^}-Darker$SIZE United-${distro^}-Dark$SIZE
  mv United-${distro^}$SIZE.tar.gz ../..
  cd ..
done

cd ..
mv United-Opensuse$SIZE.tar.gz United-OpenSUSE$SIZE.tar.gz
mv United-Ubuntu$SIZE.tar.gz United-Latest$SIZE.tar.gz

echo "Done!"
