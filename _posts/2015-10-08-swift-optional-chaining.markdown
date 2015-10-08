---
layout: post
title: Swift简书－错误处理 Error Handling
published: true
date:   2015-10-08 11:15
categories:
tags: swift
comments: true
description: more
---

Swift 中的错误是通过遵循```ErrorType```协议的数值类型实现的。

```Enum``` 通常特别适合多种错误的处理情况。比如：

```
enum VendingMachineError: ErrorType {
   case InvalidSelection
   case InsufficientFunds(coinsNeeded:Int)
   case OutOfStock
} 
```

你可以抛出一个异常：
```
throw VendingMachineError.InsufficientFunds(coinsNeeded: 5)
```

###错误处理###

当一个错误被抛出的时候，一定有一些代码来处理这些错误。
Swift有四种方式来处理错误：

> ### Propagating Errors Using Throwing Functions

看这个例子：

```
enum VendingMachineError: ErrorType {
    case InvalidSelection
    case InsufficientFunds(coinsNeeded: Int)
    case OutOfStock
}

throw VendingMachineError.InsufficientFunds(coinsNeeded: 5)

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws {
        guard var item = inventory[name] else {
            throw VendingMachineError.InvalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        --item.count
        inventory[name] = item
        dispenseSnack(name)
    }
    
}
```

```vend(itemNamed:)``` 使用```guard``` 关键字，当买东西的条件不满足的时候便可以提早退出。所以只有当所有条件都满足的时候才可以完成购买退出这个函数。

好了，因为vend这个函数抛出很多错误，name你必须处理通过```do-cache try？ try!```


> ### Do-Catch###

```
do {
    try expression
    statements
} catch pattern 1 {
    statements
} catch pattern 2 where condition {
    statements
}
```

这个地方就是```catch```不必处理所有```do```里面可能的错误。如果```catch```中有没有处理的错误，这个错误必须被处理，通过do-catch或者throw函数。
下面这个例子处理了所有的3个情况，如果都没有抛出异常，do后面语句的才继续被执行。
栗子如下：

```
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.InvalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.OutOfStock {
    print("Out of Stock.")
} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}
// prints "Insufficient funds. Please insert an additional 2 coins."
```


###用```try？```可以转化错误到Optional,```try!```禁止错误传播###
 
 
 
 
 