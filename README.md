##xiangxin 1.0 
编译内核
首先将编译内核工具链加入到你的环境配置

如 
export ARCH=arm
export CROSS_COMPILE=~/kernel/toolchain/arm-eabi-linaro-4.6.2/bin/arm-eabi-

改变kernel/makefile  里面的工具链

export KBUILD_BUILDHOST := $(SUBARCH)
ARCH		?= arm
CROSS_COMPILE	?= /home/xiangxin/kernel/toolchain/arm-eabi-linaro-4.6.2/bin/arm-eabi-


第一步构建/.config编译配置文件

make riogrande_kumquat_defconfig    

这里的riogrande_kumquat是 kernel/arch/arm/configs 里面你的机型配置文件！

第二步开始编译

make

OK,结束
