---
layout: post
title: IOS Bluetooth (二）
published: false
date:   2015-09-09 10:51
categories:
tags:
comments: true
description: more
---

Core Bluetooth framework 让IOS／MAC应用与低功耗的蓝牙设备通信。比如你的应用可以发现，浏览交互低功耗的外围设备：心率监听器，数字温度调节器，甚至其它IOS设备。

当你用本地的中心来与远程的外围交互的时候，就是在蓝牙低功耗通信的中心端执行动作。除非你设置了一个本地的外围设备，用它响应中心的请求，大部分的蓝牙事务会在中心端发生。



