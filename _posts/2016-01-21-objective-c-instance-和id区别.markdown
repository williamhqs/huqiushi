---
layout: post
title: Objective C instance 和id区别
published: true
date:   2016-01-21 22:12
categories:
tags:
comments: true
description: more
---

`instancetype` 是有类型检查的，而`id`没有，所以编译器用instancetype就知道什么返回类型以便更好的检查你的代码和`autocompete`.

Apple这样说的：
>In your code, replace occurrences of id as a return value with instancetype where appropriate. This is typically the case for init methods and class factory methods. Even though the compiler automatically converts methods that begin with “alloc,” “init,” or “new” and have a return type of id to return instancetype, it doesn’t convert other methods. Objective-C convention is to write instancetype explicitly for all methods.

http://stackoverflow.com/questions/8972221/would-it-be-beneficial-to-begin-using-instancetype-instead-of-id
