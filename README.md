通用模板 pod-template
============

## 使用方式

```
pod lib create 名字 --template-url=http://gitlab.gwm.cn/gwm-ios/gwpod-template.git

举个🌰

pod lib create AAA --template-url=http://gitlab.gwm.cn/gwm-ios/gwpod-template.git
```

## 创建本地组件注意项
创建本地组件时，文件存在，sourcetree提交是看不到文件的。

- 1.先删除`AAA`组件目录中.git开头的文件、文件夹。
- 2.执行命令 `git rm --cached LocalPods/AAA`，路径按实际情况填写。
- 3.回到sourcetree刷新，就会出现`AAA`文件目录了。


## 组件库命名规范

- 1.基础组件用**Base开头**，例如：BaseExtension
- 2.接口模型层组件用**service结尾**，例如如：MessageService
- 3.UI业务层暂时没有明确规范。如果名字容易混淆，可以用**Business结尾**，例如：XXBusiness

## Guide

 https://guides.cocoapods.org/making/using-pod-lib-create.html 

## 终端输出示例

```
pod lib create AAA --template-url=http://gitlab.gwm.cn/gwm-ios/gwpod-template.git
Cloning `http://gitlab.gwm.cn/gwm-ios/gwpod-template.git` into `AAA`.
Configuring AAA template.
security: SecKeychainSearchCopyNext: The specified item could not be found in the keychain.

------------------------------

To get you started we need to ask a few questions, this should only take a minute.

If this is your first time we recommend running through with the guide:
 - https://guides.cocoapods.org/making/using-pod-lib-create.html
 ( hold cmd and click links to open in a browser. )


What platform do you want to use?? [ iOS / macOS ]
 > ios

What language do you want to use?? [ Swift / ObjC ]
 > swift

Would you like to include a demo application with your library? [ Yes / No ]
 > yes

Which testing frameworks will you use? [ Quick / None ]
 > none

Would you like to do view based testing? [ Yes / No ]
 > no
security: SecKeychainSearchCopyNext: The specified item could not be found in the keychain.
security: SecKeychainSearchCopyNext: The specified item could not be found in the keychain.
security: SecKeychainSearchCopyNext: The specified item could not be found in the keychain.
security: SecKeychainSearchCopyNext: The specified item could not be found in the keychain.
security: SecKeychainSearchCopyNext: The specified item could not be found in the keychain.
security: SecKeychainSearchCopyNext: The specified item could not be found in the keychain.
hint: Using 'master' as the name for the initial branch. This default branch name
hint: is subject to change. To configure the initial branch name to use in all
hint: of your new repositories, which will suppress this warning, call:
hint:
hint:     git config --global init.defaultBranch <name>
hint:
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this command:
hint:
hint:     git branch -m <name>

Running pod install on your new library.

Analyzing dependencies
Downloading dependencies
Installing AAA (0.1.0)
Generating Pods project
Integrating client project

[!] Please close any current Xcode sessions and use `AAA.xcworkspace` for this project from now on.
Pod installation complete! There is 1 dependency from the Podfile and 1 total pod installed.

[!] Your project does not explicitly specify the CocoaPods master specs repo. Since CDN is now used as the default, you may safely remove it from your repos directory via `pod repo remove master`. To suppress this warning please add `warn_for_unused_master_specs_repo => false` to your Podfile.

 Ace! you're ready to go!
 We will start you off by opening your project in Xcode
  open 'AAA/Example/AAA.xcworkspace'

To learn more about the template see `http://gitlab.gwm.cn/gwm-ios/gwpod-template.git`.
To learn more about creating a new pod, see `https://guides.cocoapods.org/making/making-a-cocoapod`.
```
# PodTemplate
