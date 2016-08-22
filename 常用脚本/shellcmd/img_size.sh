#
#  bundle_imgsize.sh
#  mszx
#
#  Created by wenyanjie on 15-3-02.
#  Copyright (c) 2015年 wenyanjie. All rights reserved.
#
#  打印res文件夹下大小大于100K的图片资源

#  获取脚本所在目录
filepath=$(cd "$(dirname "$0")"; pwd)
cd $filepath
cd ..

echo "大小超过100K的图片资源:"
find res | grep @2x.png$ | while read line
do
if [ "$line" ]
then
    filesize=$(ls -l $line | awk '{ print $5 }')
    filelimit=100000
    if [ $filesize -gt $filelimit ]
    then
        echo "$line" "$filesize"
    fi
fi
done
