---
layout: post
title: Objective C 中枚举（循环）的选择
published: true
date:   2015-08-30 15:09
categories: IOS
tags: Objective-C, loop
comments: true
description: Objective C 选择高效的循环
---

* 1 基本for循环

Objective C中提到循环，自然想到的是 *for* 方法。

{% highlight ruby %}

for (int i=0; i < 10; i ++ ){}

{% endhighlight %}

没错，不过功能很有限，如果遍历NSDictionary， NSSet等那么就要写很多代码了，而且还要使用一些临时数组等，这里不演示了。

* 2 NSEnumerator

那么你可能不知道在Objective C 1.0里面可以使用 NSEnumerator方法。
{% highlight ruby %}
NSArray *ar = [NSArray new];
    NSEnumerator * en = [ar objectEnumerator];
    id object;
    while ((object = [en nextObject]) != nil) {
        //Do whatever
    }
    
{% endhighlight %}

他的好处是不管便利什么数组，字典等用一种类型的代码就好了。
反向遍历的时候还有个reverseObjectEnumerator 方法。

*3 for ... in ...

一般称作快速便利，在我看来没什么好说的就是for一样。

*4 块

{% highlight ruby %}
[[NSArray new] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
    }];
{% endhighlight %}

这种方法是在新特性里面引入的，用GCD来并发执行当然效率就高了。而且有时候你在for里面要执行一个：

```
NSString *string = (NSString *) object;
```
那这个块枚举你就直接把block的***id obj*** 改成 ***NSString *obj*** 就可以了，当然前提是你必须知道里面的确切类型。

以上就是各种循环的方法，你可以自行选择，当然swift里面就有更爽的***map***等方法了，以后再说。






