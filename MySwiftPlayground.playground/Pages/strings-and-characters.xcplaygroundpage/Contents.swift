//: [Previous](@previous)
//: # 字符串和字符

import Foundation

//: 字符串字面量、多行
let someString = "Some string literal value"
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
    
func generateQuotation() -> String {
    let quotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin,
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, "and go on
        till you come to the end; then stop."
        """
    return quotation
}
print(quotation == generateQuotation())

// 扩展字符串分隔符
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
let break0 = "Line 1 \n Line 2"
let break1 = #"Line 1\nLine 2"#
let break2 = #"Line 1\#nLine 2"#
let break3 = ###"Line 1\###nLine 2"###

// 初始化
var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
if emptyString.isEmpty && anotherEmptyString.isEmpty {
    print("nothing to see here")
}
var variableString = "Horse"
variableString += " and carriage"

for character in "Dog!🐶️" {
    print(character)
}
let exclamationMark: Character = "!"
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱️"]
let catString = String(catCharacters)
print(catString)

// 连接
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

welcome.append(exclamationMark)

let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)
 
let goodStart = """
one
two
 
"""
print(goodStart + end)

// 字符串插值
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

print(#"Write an interpolated string in Swift using \(multiplier)."#)
print(#"6 times 7 is \#(6 * 7)."#)
print("6 times 7 is \(6 * 7).")


//: ### 总结
//: 扩展字符串分隔符
//: [Next](@next)
