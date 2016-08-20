#!/bin/sh

filepath=$(cd "$(dirname "$0")"; pwd)"/"
cd $filepath
#cd ..


#静态库包含的 architecture
array=("i386" "x86_64" "armv7" "armv7s" "arm64")
#静态库名称
libname="libCMBC_iOS_C2CPay.a"

#需要解压出来的静态库 architecture
archname=${array[2]}.a


#静态库包含的指令集 architectures
fun1()
{
  lipo -info ${libname}
}

#解压静态库
fun2()
{
  lipo ${libname} -thin armv7 -output ${archname}
  ar -x ${archname}
  open $filepath
}


#选择执行相应的方法 fun1/fun2
fun2










#------------------------------------------

#静态库包含的指令集 architectures 信息
fun3()
{
file ${libname}
}


#查找结尾为 .a 的文件
#find . -name "*.a" -print









