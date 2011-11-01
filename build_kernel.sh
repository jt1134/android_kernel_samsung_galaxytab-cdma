#!/bin/bash

TREE="device/samsung/vzwtab"

make clean mrproper
make ARCH=arm p1_defconfig

make -j8 modules
for M in `find . -name *.ko`
do
  cp "$M" ../../../"$TREE"/modules
done

make -j8
cp arch/arm/boot/zImage ../../../"$TREE"/kernel

