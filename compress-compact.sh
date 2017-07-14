#! /bin/bash
DISTROS="distros.txt"

echo "Compressing..."

for distro in `cat $DISTROS`; do
    cd Compiled-Compact
    cd United-${distro^}-Compact
    cp ../../src/index.theme United-${distro^}-Compact
    cp ../../src/index.theme United-${distro^}-Dark-Compact
    cp ../../src/index.theme United-${distro^}-Darker-Compact
    tar -czf United-${distro^}-Compact.tar.gz United-${distro^}-Compact United-${distro^}-Light-Compact United-${distro^}-Darker-Compact United-${distro^}-Dark-Compact
    mv United-${distro^}-Compact.tar.gz ../..
    cd ..
done

cd ..
mv United-Opensuse-Compact.tar.gz United-OpenSUSE-Compact.tar.gz
mv United-Ubuntu-Compact.tar.gz United-Latest-Compact.tar.gz
