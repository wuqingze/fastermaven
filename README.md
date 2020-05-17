# fastermaven
一个很常见的场景是我们修改了某个Java文件，需要编译运行验证一下结果，
常见的用法是用mvn test命令，会将修改的文件编译，运行单元测试。
这个工具就是将上面的过程提取出来，进行定制化加速。

## 用法
在maven工程第一级目录下（和src同一目录）运行t.sh脚本，会产生一下4个脚本，
* compile_main.sh--编译main目录的文件
* run_main.sh--运行main目录的main函数
* compile_test.sh--编译test目录l下的修改文件
* run_test.sh--运行单元测试
