#
#  build_ipa.sh
#  mszx
#
#  Created by wenyanjie on 15-6-15.
#  Copyright (c) 2015年 wenyanjie. All rights reserved.
#
#  自动将MSZX项目打包为ipa文件
#  provisioningProfile 需要修改为你电脑上的证书名


#  获取脚本所在目录
filepath=$(cd "$(dirname "$0")"; pwd)
cd $filepath
cd ..

projectdir=$(pwd)
echo "$projectdir"
projectname="FireflyFramework.xcodeproj"
scheme="FireflyFramework"
xcarchiveName="FireflyFramework.xcarchive"
xcarchivePath="$filepath/$xcarchiveName"

today=`date +%y%m%d%H%M%S`
ipaName="Firefly_$today.ipa"
exportPath="$filepath/$ipaName"
archiveprovisioningProfile="signFireflyApp150911"
provisioning_Profile="35d101e8-d05f-4e0c-90cc-d0c24ac937eb"

echo "project:$projectdir/$projectname"

#第一步先编译生成MSZX.xcarchive 文件。

#xcodebuild -archivePath "$xcarchivePath" -project "$projectdir/$projectname" -sdk iphoneos  -scheme "$scheme" -configuration "Release Adhoc"  clean

xcodebuild -archivePath "$xcarchivePath" -project "$projectdir/$projectname" -sdk iphoneos  -scheme "$scheme" -configuration "Release Adhoc" "PROVISIONING_PROFILE =$provisioning_Profile" "PRODUCT_BUNDLE_IDENTIFIER =com.signcmbc.firefly.framework" archive


#第二步把生成的MSZX.xcarchive文件打包成ipa 格式。

xcodebuild -exportArchive -exportFormat IPA -exportProvisioningProfile "$archiveprovisioningProfile" -archivePath "$xcarchivePath" -exportPath "$exportPath"

rm -rf $xcarchivePath
