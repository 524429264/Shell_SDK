#
#  build_lib.sh
#  mszx
#
#  Created by wenyanjie on 15-8-29.
#  Copyright (c) 2015年 wenyanjie. All rights reserved.
#
#  自动将MSZX项目里的lib target打包为lib库


#!/bin/sh

#  获取脚本所在目录
filepath=$(cd "$(dirname "$0")"; pwd)"/"
cd $filepath
cd ..


#  工程target，主要配置这个target即可
targetname="TestFramework"

#  工程目录(默认工程目录在脚本目录的上一级目录)
projectdir=$(pwd)"/"
echo $projectdir
#  工程名
projectname="FireflyFramework.xcodeproj"
#  lib输出目录
buildDir=$filepath
echo $buildDir
#lib输出名
libname=$targetname

iossdknum=$(xcodebuild -showsdks | grep iphoneos | grep -Eo '[0-9.]+' | sed -n '1p')
configurationname="Release"

mydir=$filepath$libname"/"
rm -rf $mydir
mkdir $mydir

# arm64
archname="arm64"
lib64=$libname"64"
echo "archname:$archname"
xcodebuild -project $projectdir$projectname -configuration $configurationname -target $targetname -sdk "iphoneos$iossdknum" -arch $archname BUILD_DIR=$buildDir clean
xcodebuild -project $projectdir$projectname -configuration $configurationname -target $targetname -sdk "iphoneos$iossdknum" -arch $archname BUILD_DIR=$buildDir
libpath=$buildDir"/Release-iphoneos/"$libname".framework"
lib64path=$mydir$lib64
mv -f $libpath"/"$libname $lib64path

# armv7
archname="armv7"
libv7=$libname"v7"
echo "archname:$archname"
xcodebuild -project $projectdir$projectname -configuration $configurationname -target $targetname -sdk "iphoneos$iossdknum" -arch $archname BUILD_DIR=$buildDir clean
xcodebuild -project $projectdir$projectname -configuration $configurationname -target $targetname -sdk "iphoneos$iossdknum" -arch $archname BUILD_DIR=$buildDir
libpath=$buildDir"/Release-iphoneos/"$libname".framework"
libv7path=$mydir$libv7
mv -f $libpath"/"$libname $libv7path
 
# armv7s
archname="armv7s"
libv7s=$libname"v7s"
echo "archname:$archname"
xcodebuild -project $projectdir$projectname -configuration $configurationname -target $targetname -sdk "iphoneos$iossdknum" -arch $archname BUILD_DIR=$buildDir clean
xcodebuild -project $projectdir$projectname -configuration $configurationname -target $targetname -sdk "iphoneos$iossdknum" -arch $archname BUILD_DIR=$buildDir
libpath=$buildDir"/Release-iphoneos/"$libname".framework"
libv7spath=$mydir$libv7s
mv -f $libpath"/"$libname $libv7spath

# 首次移动framework的整个目录
mv -f $libpath $mydir

# 删除临时目录
rm -rf $buildDir"Release-iphoneos/"
 
 
#  i386
archname="i386"
libsimu=$libname"simu"
echo "archname:$archname"
xcodebuild -project $projectdir$projectname -configuration $configurationname -target $targetname -sdk "iphonesimulator$iossdknum" -arch $archname BUILD_DIR=$buildDir clean
xcodebuild -project $projectdir$projectname -configuration $configurationname -target $targetname -sdk "iphonesimulator$iossdknum" -arch $archname BUILD_DIR=$buildDir
libpath=$buildDir"/Release-iphonesimulator/"$libname".framework"
libsimupath=$mydir$libsimu
mv -f $libpath"/"$libname $libsimupath
 
#  x86_64
archname="x86_64"
libx86=$libname"x86"
echo "archname:$archname"
xcodebuild -project $projectdir$projectname -configuration $configurationname -target $targetname -sdk "iphonesimulator$iossdknum" -arch $archname BUILD_DIR=$buildDir clean
xcodebuild -project $projectdir$projectname -configuration $configurationname -target $targetname -sdk "iphonesimulator$iossdknum" -arch $archname BUILD_DIR=$buildDir
libpath=$buildDir"/Release-iphonesimulator/"$libname".framework"
libx86path=$mydir$libx86
mv -f $libpath"/"$libname $libx86path

rm -rf $buildDir"Release-iphonesimulator/"

cd $mydir
lipo -create $lib64 $libv7 $libv7s $libsimu $libx86 -output $libname
rm -rf $lib64
rm -rf $libv7
rm -rf $libv7s
rm -rf $libsimu
rm -rf $libx86

mv -f $libname $mydir"/"$libname".framework"

#  删除中间文件
rm -rf $projectdir"build"

open .
