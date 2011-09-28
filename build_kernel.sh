#!/bin/bash

#SRSLYWTF
mv .git DONTLOOKATME

make clean mrproper
make ARCH=arm p1_defconfig

make -j8 modules
for m in `find . -name *.ko`
do
  cp $m ../../../device/samsung/vzwtab/initramfs/lib/modules
done

make -j8

mv DONTLOOKATME .git

#exit

X="arch/arm/boot/zImage"
adb reboot download
sleep 5
heimdall flash --kernel "$X" --recovery "$X"

