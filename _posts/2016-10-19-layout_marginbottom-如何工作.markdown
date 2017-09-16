---
layout: post
title: layout_marginBottom 不工作
published: true
date:   2016-10-19 14:10
categories: Android
tags: layout
comments: true
description: more
---

今天发现设置 **layout_marginBottom** 不工作，最后发现要这样设置：


```
android:layout_alignParentBottom="true"
android:layout_marginBottom="10dp"
```            