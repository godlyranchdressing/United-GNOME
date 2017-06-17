#! /bin/bash
DISTROS="distros.txt"

echo "Compressing..."

for distro in `cat $DISTROS`; do
    cd Compiled
    cd United-${distro^}
    cp ../../src/index.theme United-${distro^}
    cp ../../src/index.theme United-${distro^}-Dark
    cp ../../src/index.theme United-${distro^}-Darker
    tar -czf United-${distro^}.tar.gz United-${distro^} United-${distro^}-Light United-${distro^}-Darker United-${distro^}-Dark
    mv United-${distro^}.tar.gz ../..
    cd ..
done

cd ..
mv United-Opensuse.tar.gz United-OpenSUSE.tar.gz
mv United-Ubuntu.tar.gz United-Latest.tar.gz
