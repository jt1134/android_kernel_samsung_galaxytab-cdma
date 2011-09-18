#!/bin/bash

#SRSLYWTF
mv .git DONTLOOKATME

make clean mrproper
make ARCH=arm p1_defconfig
make -j8

mv DONTLOOKATME .git

#exit

adb reboot download
sleep 5
heimdall flash --kernel arch/arm/boot/zImage

