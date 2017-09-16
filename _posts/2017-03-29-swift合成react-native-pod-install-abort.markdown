---
layout: post
title: Swift合成React Native Pod install abort
published: true
date:   2017-03-29 14:06
categories: ReactNative, swift
tags:
comments: true
description: more
---

如果swift项目通过cocoapods集成React Native的时候，会常见两个错误：
也就是运行
```
 pod install --verbose --no-repo-update
```


错误一：

```
[!] Unable to satisfy the following requirements:

- `Yoga (= 0.42.3.React)` required by `React/Core (0.42.3)`

None of your spec sources contain a spec satisfying the dependency: `Yoga (= 0.42.3.React)`.
```
错误二：

```
Analyzing dependencies

Inspecting targets to integrate
...

- Running post install hooks
  - Writing Xcode project file to `Pods/Pods.xcodeproj`
    - Generating deterministic UUIDs
[1]    51946 abort      pod install --verbose --no-repo-update
```

第一个错误是你的React版本 `>= 0.42.0` 会出现这个错误，解决办法就是在Podfile里面加入：

```
pod 'Yoga', path:'./ReactComponent/node_modules/react-native/ReactCommon/yoga'
```

第二个错误是你的mac 在系统10.11上苹果rootless启动了，你可以关闭
`sudo nvram boot-args="rootless=0"; sudo reboot`
关闭之后
`sudo gem install cocoapods -V`

更安全的做法就是只执行下面这句：
`sudo gem install -n /usr/local/bin cocoapods`
