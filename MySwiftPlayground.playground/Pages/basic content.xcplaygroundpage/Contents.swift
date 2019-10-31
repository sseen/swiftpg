//: [Previous](@previous)
//: # 基础内容

import Foundation

let minValue = UInt8.min
let maxValue = UInt8.max
let int32 = UInt32.max

print(minValue, maxValue, int32)

//: 类型安全和推断
let decimalInteger = 17
let binaryInteger = 0b10001 // 17 in binary notation
let octalInteger = 0o21 // 17 in octal notation
let hexadecimalInteger = 0x11 // 17 in hexadecimal notation

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

//: 数值转换
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
// pi equals 3.14159, and is inferred to be of type Double

//: 类型别名 typealias
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound is now 0

//: 元组
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")
    
// 部分省略
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

// 下标
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

// 定义时命名确定
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

//: 可选项 ?
//: oc 中 nil 类似的概念，表示缺少一个可用对象。但是只能用在对象，不能用在结构体和基础类型、枚举值上。
//: swift 可选项可以用在任何类型的值上
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

// 强制展开 !
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}

// 可选绑定 if let
if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
 
if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

// 隐式展开可选项 String!
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark
 
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark

//: 错误处理 断言和先决条件 断言只在debugz时生效
let age = -3
assert(age >= 0, "A person's age cannot be less than zero")

//: [Next](@next)
