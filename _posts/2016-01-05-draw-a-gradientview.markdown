---
layout: post
title: swift如何画一个渐变的UIView
published: true
date:   2016-01-05 14:52
categories: programming
tags: swift
comments: true
description: more
---

> 自定义一个UIView的子类 ```GSGradientView``` , 然后调用`CGContextDrawLinearGradient`方法。

具体如下：

###properties###

```
@IBDesignable public class GSGradientView: UIView {
    @IBInspectable public var startColor: UIColor = UIColor.redColor()
    @IBInspectable public var endColor: UIColor   = UIColor.greenColor()
｝
```


`@IBInspectable` 是使其可在xib／storyboard文件中直接设置颜色。
###方法###

   ```
   func gradientBackground(rect: CGRect, context:CGContext) -> CGGradient{
        let colors = [startColor.CGColor, endColor.CGColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations:[CGFloat] = [0.0, 1.0]
        let gradient = CGGradientCreateWithColors(colorSpace,
            colors,
            colorLocations)
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x:0, y:self.bounds.height)
        CGContextDrawLinearGradient(context,
            gradient,
            startPoint,
            endPoint,
CGGradientDrawingOptions.DrawsAfterEndLocation)
        return gradient!
    }
    
    override func drawRect(rect: CGRect) {
        gradientBackground(rect,context: UIGraphicsGetCurrentContext()!)
    }
    
   ```





具体代码：[https://github.com/williamhqs/GSAnalysis/blob/master/Pod/Classes/GSGradientView.swift]()