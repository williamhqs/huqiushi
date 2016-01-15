---
layout: post
title: Sotryboard或xib新添加控件如何本地化
published: true
date:   2016-01-15 18:00
categories:
tags:
comments: true
description: more
---

在`storyboard／Xib`文件中如果新添加一个`UILabel`或者`UIButton`如何本地化呢？

以前都是不过增加多少控件，直接复制整个` .strings` 文件然后重新再生成一个新的 `.strings,` 把复制好的再贴回去。这样对于很多控件可以，但是如果只增加一两个的话还是不方便的。

**新方法**：选中添加好的空间比如UILabel名字是"菜单", 在"show identifiy inspector"找到`Object ID` 如：`gjO-zT-skB`

在**Main.strings(Chinese)**里面加入：

`"gjO-zT-skB.text" = "菜单";`

在**Main.strings(English)**里面加入：
`"gjO-zT-skB.text" = "Menu";`

这种方法适用于增加的控件不多的情况