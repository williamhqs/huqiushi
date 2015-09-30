---
layout: post
title: Swift 简书 - guard 关键字
published: true
date:   2015-09-30 12:25
categories:
tags:
comments: true
description: guard 就像是if 取决于条件返回的值是否是true

---

```guard``` 就像是```if``` 取决于条件返回的值是否是```true```.

使用```guard```可以保证条件必须是```true```才能执行```guard```后面的代码。不像```if```，```guard```必须有一个```else```，这个```else```就是当条件不是```true```的时候执行的。

例子：

```
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}
```
 
 结果：
 
```
greet(["name": "John"])
// prints "Hello John!"
// prints "I hope the weather is nice near you."
greet(["name": "Jane", "location": "Cupertino"])
// prints "Hello Jane!"
// prints "I hope the weather is nice in Cupertino."
```

如果满足了guard的条件，那么在guard条件中的不管是变量还是常量都可以在guard } 后面来使用。比如例子中的location。

如果不满足条件，那么else里面的语句就会被执行。并且里面必须退出这个guard所在的block。你可以用 ```return, break, continue, throw```来跳出去，或者嗲用一个函数不返回（跳出这个block）比如：```fatalError().```


