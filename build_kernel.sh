#!/bin/bash

TREE="device/samsung/vzwtab"

#SRSLYWTF
mv .git DONTLOOKATME

make clean mrproper
make ARCH=arm p1_defconfig

make -j8 modules
for M in `find . -name *.ko`
do
  B=`basename "$M"`
  case "$B" in
  "dhd.ko")
    cp "$M" ../../../"$TREE"
    ;;
  *)
    cp "$M" ../../../"$TREE"/initramfs/lib/modules
    ;;
  esac
done

make -j8
cp arch/arm/boot/zImage ../../../"$TREE"/kernel

mv DONTLOOKATME .git

X="arch/arm/boot/zImage"
adb reboot download
sleep 5
heimdall flash --kernel "$X" --recovery "$X"

