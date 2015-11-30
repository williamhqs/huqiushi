---
layout: post
title: GIT clone所有branch到本地和如何从bitbucket fork到github
published: true
date:   2015-11-30 10:42
categories:
tags:
comments: true
description: more
---

如何将所有的branches都clone到本地

1. 首先克隆到本地

```
git clone git://example.com/myproject
$ cd myproject
```
2. 这个时候你会在master上

```
$ git branch
* master
```
3. 因为还有其他的branch隐藏在你的仓库中，通过-a标签来查看：

```
git branch -a
* develop
  master
  remotes/origin/develop
  remotes/origin/master
```
4. 这是如果你只是想看看的话那就直接checkout

```
git checkout origin/develop
```
如果想继续开发

```
git checkout -b develop origin/develop
```
好了，如果这是从bitbucket clone下来的，现在要push到github上怎么做？

```
git remote rename origin bitbucket
git remote add origin https://github.com/edwardaux/Pipelines.git
git push origin master
git remote rm bitbucket
```
