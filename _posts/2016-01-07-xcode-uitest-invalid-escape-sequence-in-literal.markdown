---
layout: post
title: XCode UITest: Invalid escape sequence in literal
published: true
date:   2016-01-07 16:00
categories: Test
tags: swift UITest
comments: true
description: 解决方法：把`["\U5bc6\U7801"]`改成

---

UI测试的时候，当点击中文的UITextField的时候，生成的代码是这样的：

```
let secureTextField = app.secureTextFields["\U5bc6\U7801"]
        secureTextField.tap()
```
但是会出现一个错误：
        **/XXXUITests.swift:46:60: Invalid escape sequence in literal**
        
解决方法：把`["\U5bc6\U7801"]`改成`["\u{5bc6}\u{7801}"]`

把**／U** 改成**／u** 会出现错误：**/XXXUITests.swift:46:54: Expected hexadecimal code in braces after unicode escape**