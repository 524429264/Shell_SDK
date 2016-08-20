##打包静态库工程##
方法一:
1.将 build_lib.sh 引入到和 SDK 工程中同工程名字相同的文件夹下
2.打开build_lib.sh 添加工程名称
3.打开终端, 执行 build_lib.sh 脚本文件

方法二:
>
1.在 SDK 工程创建 Aggregate 
2.选中创建的 Aggregate -> Build Phases -> New Run Script Phases 
3.将 lib.sh 中的内容复制到Shell 脚本框内
4.在选择模拟器左边 单击选中创建的 Aggregate
5.执行 command+B 编译工程
####[参考博文:](http://www.jianshu.com/p/69a9b6d9875e)####




##解压静态库##
>
1.新建一个空文件夹,将 decompressionArch.sh 与需要解压的静态库放入
2.打开 decompressionArch.sh 添加静态库名称
3.在终端执行 decompressionArch.sh
####[参考博文:](http://www.jianshu.com/p/cc5c69332dc6)####

