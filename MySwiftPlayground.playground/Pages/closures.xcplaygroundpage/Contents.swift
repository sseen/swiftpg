//: [Previous](@previous)
//: # 闭包
//: 闭包能够捕获和存储定义在其上下文中的任何常量和变量的引用，这也就是所谓的闭合并包裹那些常量和变量，因此被称为“闭包”，Swift 能够为你处理所有关于捕获的内存管理的操作。
//: 在函数章节中有介绍的全局和内嵌函数，实际上是特殊的闭包。闭包符合如下三种形式中的一种：
//: 全局函数是一个有名字但不会捕获任何值的闭包；
//: 内嵌函数是一个有名字且能从其上层函数捕获值的闭包；
//: 闭包表达式是一个轻量级语法所写的可以捕获其上下文中常量或变量值的没有名字的闭包。

import Foundation

let names = ["Chris","Alex","Ewa","Barry","Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

//: 闭包表达式 { (parameters) -> (return type) in statements }
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
// 1，语境推断类型。由于排序闭包为实际参数来传递给方法，Swift 就能推断它的形式参数类型和返回类型。 sorted(by:) 方法是在字符串数组上调用的，所以它的形式参数必须是一个 (String, String) -> Bool 类型的函数。这意味着 (String, String)和 Bool 类型不需要写成闭包表达式定义中的一部分。
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
// 2，从但表达式闭包隐式返回。单表达式闭包能够通过从它们的声明中删掉 return 关键字来隐式返回它们单个表达式的结果.这里， sorted(by:) 函数类型的实际参数已经明确必须通过闭包返回一个 Bool 值。
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
// 3，简写的实际参数名。Swift 自动对行内闭包提供简写实际参数名，你也可以通过 $0 , $1 , $2 等名字来引用闭包的实际参数值。
reversedNames = names.sorted(by: { $0 > $1 } )
// 4，运算符函数。实际上还有一种更简短的方式来撰写上述闭包表达式。Swift 的 String 类型定义了关于大于号（ >）的特定字符串实现，让其作为一个有两个 String 类型形式参数的函数并返回一个 Bool 类型的值。这正好与  sorted(by:) 方法的第二个形式参数需要的函数相匹配。因此，你能简单地传递一个大于号，并且 Swift 将推断你想使用大于号特殊字符串函数实现
reversedNames = names.sorted(by: >)

//: 尾随闭包，闭包作为函数的形式参数的最后一个参数时，使用尾形闭包增加可读性。
func someFunctionThatTakesAClosure(closure:() -> Void){
      //function body goes here
 }

 //here's how you call this function without using a trailing closure

someFunctionThatTakesAClosure(closure: {
      //closure's body goes here
 })
   
 //here's how you call this function with a trailing closure instead
     
someFunctionThatTakesAClosure() {
      // trailing closure's body goes here
 }
// 5 尾形闭包
reversedNames = names.sorted() { $0 > $1 }
// 6 唯一参数的话可以省略圆括号
reversedNames = names.sorted { $0 > $1 }

let digitNames = [
    0: "Zero",1: "One",2: "Two",  3: "Three",4: "Four",
    5: "Five",6: "Six",7: "Seven",8: "Eight",9: "Nine"
 ]

 let numbers = [16,58,510]
let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

//: 捕获值，闭包是引用类型
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
//: 逃逸闭包 @escaping，闭包作为函数的实际参数的时候，我们就说闭包逃逸了，因为它是在函数返回之后调用的。如果闭包会存储在函数外的变量里，必须显示标记 escaping。一旦标记 escaping，意味着你必须在闭包里显示引用 self
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}
 
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
 
let instance = SomeClass()
instance.doSomething()
print(instance.x)
 
completionHandlers.first?()
print(instance.x)
// 自动闭包



//: ### 总结
//: 自动闭包
//: [Next](@next)
