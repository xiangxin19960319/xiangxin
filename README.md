##xiangxin 1.0 
编译内核

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
