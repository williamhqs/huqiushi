---
layout: post
title: NSThread/NSTimer in swift
published: true
date:   2015-08-28 23:49
categories: IOS, swift
comments: true
description: more
---

###1. NSTimer in main thread

***(1)*** use ```NSTimer init ``` method

{% highlight ruby %}

let timer = NSTimer(timeInterval: 1, target: self, selector: "timerSelector", userInfo: nil, repeats: true)

NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)

{% endhighlight %}

***(2)*** use ```NSTimer``` class method, in this way you don't need to addTimer into main runloop.

{% highlight ruby %}
NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timerSelector", userInfo: nil, repeats: true)
{% endhighlight %}
***(1)*** & ***(2)*** ***Selector methods***

{% highlight ruby %}
func timerSelector(){
    println("time start1")
}
{% endhighlight %}

###2. NSTimer in sub NSThread

Start a new thread in mainthread

{% highlight ruby %}

NSThread.detachNewThreadSelector("timer", toTarget: self, withObject: nil)
{% endhighlight %}

Add Timer in the new thread. The key is you have to call thread's runloop ```run``` method. If you use ```scheduledTimerWithTimeInterval``` also need to call this method.

{% highlight ruby %}   
func timer (){
        let timer = NSTimer(timeInterval: 0.5, target: self, selector: "timerStart", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        NSRunLoop.currentRunLoop().run()
}
{% endhighlight %}
***Selector methods***

{% highlight ruby %} 
func timerStart(){
    println("time start1")
}
{% endhighlight %}
