###打包静态库工程##
#####方法一:

1. 将 build_lib.sh 引入到和 SDK 工程中同工程名字相同的文件夹下 

2. 打开build_lib.sh 添加工程名称

3. 打开终端, 执行 build_lib.sh 脚本文件

#####方法二:

1. 在 SDK 工程创建 Aggregate 

2. 选中创建的 Aggregate -> Build Phases -> New Run Script Phases 

3. 将 lib.sh 中的内容复制到Shell 脚本框内

4. 在选择模拟器左边 单击选中创建的 Aggregate

5. 执行 command+B 编译工程

#####[参考博文:](http://www.jianshu.com/p/69a9b6d9875e)####




###解压静态库##
1. 新建一个空文件夹,将 decompressionArch.sh 与需要解压的静态库放入

2. 打开 decompressionArch.sh 修改解压出来的静态库,
 默认为 armv7
 
3. 在终端执行 decompressionArch.sh

#####[参考博文:](http://www.jianshu.com/p/cc5c69332dc6)


###图片处理脚本###
  下载 **常用脚本** ,文件打开 shellCmd 文件
 
  1. img_search.sh 遍历res目录下 所有图片 找出没有在src中利用到的图片;
  
  2. img_size.sh 打印res文件夹下大小大于100K的图片资源
  
  3. build_plist.sh 根据res下文件结构，构建config.plist
 

--------------------------




###扫描下方二维码关注我###

![零距离仰望星空](http://upload-images.jianshu.io/upload_images/1485695-3eca430266100927.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

####在此感谢各位读者的来访,您的关注是我写作分享的最大动力。