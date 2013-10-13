#!/sbin/sh
#===============================================================================
#
#          FILE: data_restore.sh
# 
#         USAGE: ./data_restore.sh 
# 
#   DESCRIPTION: 用于在recovery下恢复/data分区上的数据；
# 
#       OPTIONS: ---
#  REQUIREMENTS: 在recovery下由刷机脚本完成，注意权限；
#          BUGS: ---
#         NOTES: 请先把备份至/sdcard/data.tar的文件放置于zip卡刷包内；
#        AUTHOR: linkscue (scue), linkscue@gmail.com
#       CREATED: 2013年03月09日 21时29分54秒 HKT
#     COPYRIGHT: Copyright (c) 2013, linkscue
#      REVISION: 0.1
#  ORGANIZATION: ATX破晓组
#===============================================================================
# 还原数据的来源;
tar_file=/tmp/data.tar

if [ -e /data/light_themes ]
then
    # do nothing
    exit
else
    /sbin/busybox rm -r /tmp/data.tar
    /sbin/busybox cp /sbin/data.tar /tmp/data.tar
    busybox tar zxvf $tar_file

fi