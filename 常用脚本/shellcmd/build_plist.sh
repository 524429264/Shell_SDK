#
#  bundle_plist.sh
#  mszx
#
#  Created by wenyanjie on 14-3-20.
#  Copyright (c) 2014年 wenyanjie. All rights reserved.
#
#  根据res下文件结构，构建config.plist


filepath=$(cd "$(dirname "$0")"; pwd)"/"
cd $filepath
cd ..
/usr/libexec/PlistBuddy -c "Delete :res" res/resconfig.plist
find res | grep .jpg$ | while read line

do
if [ "$line" ]
then
path1=${line#res/}
path2=${path1%.jpg}
path3=${path2//\//_}

image_path=${line%.jpg}

/usr/libexec/PlistBuddy -c "Add :res:$path3 string \"/$image_path.jpg\"" res/resconfig.plist
fi
done


