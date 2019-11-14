//: [Previous](@previous)
//: # 类和结构体

import Foundation

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

//: 类和结构体不同之处
// 1 结构体默认初始化器
let vga = Resolution(width: 640, height: 480)

// 2 结构体和枚举是 值 类型，传值总是被 拷贝
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

// 3 类是引用类型
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}


//: ### 总结
//:
//: [Next](@next)
