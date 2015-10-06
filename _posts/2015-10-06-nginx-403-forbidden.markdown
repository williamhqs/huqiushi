---
layout: post
title: Nginx 添加虚拟机给予不同端口
published: true
date:   2015-10-06 15:41
categories: Nginx
tags:
comments: true
description: more
---

Nginx 添加不同端口的虚拟机：

```
server {
    listen       80;
    server_name  example.org  www.example.org;
    root         /var/www/port80/
}

server {
    listen       81;
    server_name  example.org  www.example.org;
    root         /var/www/port81/
}
```
然后 ```nginx -s reload``` 不用重启nginx。

你的root可能遇到403 forbidden的问题也就是权限不够：
```chmod o+x /home``` 可能会帮到你.