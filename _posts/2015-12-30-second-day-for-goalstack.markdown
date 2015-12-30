---
layout: post
title: Goalstack 第二天
published: false
date:   2015-12-30 15:07
categories: Rails
tags: Goalstack
comments: true
description: more
---

昨天决定做了，然后本打算早上早起，不过还是没起来，起床后都8点多了。看了个电影，应该是一半电影叫做《绝命海拔》,还不错，不过总之觉得就是人是对抗不了大自然的，还是要锻炼个健康的体魄比什么都好，所以晚上打羽毛球！

匆匆来到公司结果已经是下午于是继续昨天的工作，开发这个网站，下面就写下我遇到的问题，有得很弱智，不过谁都不是什么错误没有犯过好的工程师就是不要怕犯错，什么？你说“码农”？对了，码农。


## 问题1 
###twitter-bootstrap-rails undefined local variable or method `html'

这个错误很弱智，因为我copy了github上他们的example代码结果出了这个错误，我就stackoverflow下结果发现就是个语法错误
>总结，当你google一个问题没有的时候就要考虑不是每个人都有这个问题，或者不常见，那么这个问题就有可能是个弱智问题了。

家丑外扬下吧
[http://stackoverflow.com/questions/34524112/twitter-bootstrap-rails-undefined-local-variable-or-method-html]()


## 问题2 form_for  不能是空nil或者empty

*First argument in form cannot contain nil or be empty*

也就是form_for第一个参数不能为空 这个就是Rails 4 的问题了
解决方法那就是 用Model.new 替换@model

这里还有个问题，下面的代码：

``` ruby
<%= form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>
```
devise里面这样用可以了，也就是能找到resource是user，那么在没用devise的controller里面怎么办？

```
module ApplicationHelper
  def resource_name
      :user
    end

    def resource
      @resource ||= User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end
end
```





## 问题3 html.erb 如何注释
单行

`<%-# commented line -%>`

多行

```ruby
<!--
<% if false %>
code to comment
<% end %>
-->
```
