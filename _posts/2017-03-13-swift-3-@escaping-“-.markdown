---
layout: post
title: Swift 3 @escaping

published: true
date:   2017-03-13 11:40
categories:
tags:
comments: true
description: "@noescape和@escaping的区别"
---

这两个别混淆，实际上也很难混淆，就理解就可以了。因为他们都是存在不同的`swift` 版本里面。

`swift 2` 的时候用`@noescape`, 在`swift 3`就被移除了。并且引入了`@escaping`. 

他们两个都是什么意思呢？

###escaping 闭包是什么？ （@escaping）

也就是给一个函数传递一个闭包参数并且函数返回之后才被调用，那么这个闭包就是在**escaping**。也叫闭包参数**excapes**了这个函数体。这就是**escaping闭包**，用的都是ing你可以体会下，不得不说真是很合理啊...!

`Swift2`你可以用`@noescape`定义一个函数参数，告诉编译器传递到函数参数的闭包不能`escapes`函数体。默认的情况下是`escape`的，所以闭包前面通常什么也不用加也不会有错误提示。

`@noescape` 在`swift3`里面虽然移除了但是却是默认属性。也就是默认的情况下是不`escape`函数体。所以`@noescape`已经**deprecated**了，所以你就别用就对了。

`@escaping` 也用在参数类型前面，不像`swift2` 用在参数名前。

默认**non-escaping**有很多好处，编译器能更好的优化你代码。如果编译器知道一个闭包是**non-escaping**，很多内存管理的本质的细节都会很好的处理。

还有一个就是在**non-escaping**的闭包里用`self`都没有问题，因为闭包是在函数返回之前被调用的。所以闭包里面就不需要用弱引用`self`了。



