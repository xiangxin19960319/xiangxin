#!/bin/bash
#**************************************************#
# Make sony's boot.img
# Xperia
#**************************************************#

# Tools
TOOL_MKELF=$(dirname $0)/tools/mkelf.py

# Files
OUTPUT_BOOTIMG='new_kernel.elf'
ADDR_TAG='addr'

ls kernel 2>&1 > /dev/null
if [ "$?" != "0" ];then
	echo ">>> ERROR, kernel doesn't exist!"
	exit 1
fi

FILE_KERNEL="kernel"
FILE_KERNEL_ADDR=$(cat "$ADDR_TAG"_"$FILE_KERNEL")

DIR_RAMDISK="ramdisk"
FILE_RAMDISK="ramdisk.img"
FILE_RAMDISK_ADDR=$(cat "$ADDR_TAG"_"ramdisk.img")

#FILE_CMDLINE="cmdline.txt"
#FILE_CMELINE_ADDR=$(cat "$ADDR_TAG"_"$FILE_CMDLINE")

OTHER_PARAM=""
for file in `ls *-[0-19]*`
do
	addrValue=$(cat "$ADDR_TAG"_"$file")
	OTHER_PARAM="$OTHER_PARAM $file\@$addrValue"
done
#./mkbootfs ../ramdisk-U | gzip > ./ramdisk.img
# Generate ramdisk file
tools/mkbootfs ramdisk | gzip > $FILE_RAMDISK

# Make kernel-updated.elf
echo "python $TOOL_MKELF -o $OUTPUT_BOOTIMG \
       $FILE_KERNEL@$FILE_KERNEL_ADDR \
       $FILE_RAMDISK@$FILE_RAMDISK_ADDR,ramdisk \
#       $FILE_CMDLINE@$FILE_RPM_ADDR,cmdline \
       $OTHER_PARAM "

python $TOOL_MKELF -o $OUTPUT_BOOTIMG \
       $FILE_KERNEL@$FILE_KERNEL_ADDR \
       $FILE_RAMDISK@$FILE_RAMDISK_ADDR,ramdisk \
#       $FILE_CMDLINE@$FILE_CMDLINE_ADDR,cmdline \
       $OTHER_PARAM

# Clear temporary files
rm $FILE_RAMDISK
