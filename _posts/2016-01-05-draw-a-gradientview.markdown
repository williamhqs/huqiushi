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
   
   ###用法###
   
   1. 直接拖拽到`UIView`到`xib`文件或者`storyboard`,修改class为`GSGradientView`
   
   2. 代码
   
   ```
   let gradientView = GSGradientView(frame: CGRectMake(80,370,220,128))
   gradientView.startColor = UIColor.blueColor()
   gradientView.cornerSize = CGSize(width: 10, height: 10)
   gradientView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(gradientView)
        
   ```
      
具体代码：[https://github.com/williamhqs/GSAnalysis/blob/master/Pod/Classes/GSGradientView.swift]()