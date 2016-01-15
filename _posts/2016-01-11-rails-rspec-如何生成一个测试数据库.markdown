---
layout: post
title: Rails rspec 如何生成一个测试数据库
published: true
date:   2016-01-11 12:38
categories:
tags:
comments: true
description: more
---


创建测试数据库
`rake db:create RAILS_ENV=test`

`rake db:drop RAILS_ENV=test`

load schema.rb

`rake db:schema:load RAILS_ENV=test`

创建测试数据库中的表
`rake db:migrate db:test:prepare`


