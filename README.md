通用模板 pod-template
============

## 使用方式

```
pod lib create 名字 --template-url=git@github.com:jingxuelong/PodTemplate.git

举个🌰

pod lib create AAA --template-url=git@github.com:jingxuelong/PodTemplate.git
```

## 创建本地组件注意项
创建本地组件时，文件存在，sourcetree提交是看不到文件的。

- 1.先删除`AAA`组件目录中.git开头的文件、文件夹。
- 2.执行命令 `git rm --cached LocalPods/AAA`，路径按实际情况填写。
- 3.回到sourcetree刷新，就会出现`AAA`文件目录了。


## Guide

 https://guides.cocoapods.org/making/using-pod-lib-create.html 
