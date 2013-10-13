#!/bin/sh

cp ../u8500/arch/arm/boot/zImage ./zImage
cp ../u8500/net/compat-wireless/drivers/staging/cw1200/cw1200_core.ko ramdisk-u/lib/modules/
cp ../u8500/net/compat-wireless/drivers/staging/cw1200/cw1200_wlan.ko ramdisk-u/lib/modules/
./mkbootfs ramdisk-u | gzip > ramdisk.img
python mkelf.py -o kernel.elf zImage@0x00008000 ramdisk.img@0x1000000,ramdisk cmdline.txt@cmdline
zip -r ./cwm.zip ./kernel.elf ./META-INF
java -classpath testsign.jar testsign ./cwm.zip ./Xiangxin-Stock.zip
cp Xiangxin-Stock.zip ../output
cp kernel.elf ../output
rm kernel.elf
rm cwm.zip
rm Xiangxin-Stock.zip
rm ramdisk.img
rm zImage
