#
#  find_image.sh
#  mszx
#
#  Created by wenyanjie on 14-3-20.
#  Copyright (c) 2014年 wenyanjie. All rights reserved.
#  遍历res目录下 所有图片 找出没有在src中利用到的图片

#  获取脚本所在目录
filepath=$(cd "$(dirname "$0")"; pwd)
cd $filepath
cd ..

echo "没有直接用到的图片索引:"

find res | grep @2x.png$ | while read line
do
if [ "$line" ]
then
path1=${line#res/}
path2=${path1%@2x.png}
path3=${path2//\//_}

image_path=${line%@2x.png}

file_count=0
baseCount=0

currentPath="src"

if !(res=`grep -rl $path3 $currentPath`)
then
echo "$path3 "
fi

fi

done
