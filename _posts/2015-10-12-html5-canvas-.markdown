---
layout: post
title: HTML5 Canvas 文字和图片高清屏模糊问题
published: true
date:   2015-10-12 22:46
categories:
tags: Html5, javaScript
comments: true
description: 在Macbook retina屏幕或者1920x1080的高分屏幕上，用```canvas```上面画用```fillText```文字的时候时候文字看上去很模糊
---

>SVG, 可缩放矢量图形（Scalable Vector Graphics，SVG）是基于可扩展标记语言（XML），用于描述二维矢量图形的一种图形格式。SVG由W3C制定，是一个开放标准。

也就是SVG是分辨率独立的。而```canvas```我们需要自己确定分辨率。在Macbook retina屏幕或者1920x1080的高分屏幕上，用```canvas```上面画用```fillText```文字的时候时候文字看上去很模糊，图片也是。这个问题如何解决呢？

也就是根据屏幕来适应canvas的大小。代码如下：

```
$(function(){
   			var cv = document.getElementById('canvas');
			var ctx = cv.getContext("2d");
			//获取设备的像素率
			var pixelRatio = window.devicePixelRatio || 1;
			//缩放画布改变css宽和高来变成高分辨率
			cv.style.width = cv.width +'px';
			cv.style.height = cv.height +'px';
			cv.width *= pixelRatio;
			cv.height *= pixelRatio;
			//自然我们的文字图片等也要进行相应的缩放
			ctx.setTransform(pixelRatio,0,0,pixelRatio,0,0);
			//这个就显示了一个不模糊的文字
			ctx.font="30px Arial";
			ctx.fillText("Big smile!",10,90);
			
        })
```
很简单试试就知道了。