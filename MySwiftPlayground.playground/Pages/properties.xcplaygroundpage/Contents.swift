//: [Previous](@previous)
//: # 属性

import Foundation

// 存储属性
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

// 常量结构体实例的存储属性，结构体设置为常量属性，那么就算内部属性有设置为var，也不能修改，这是由于结构体是值类型。当一个值类型的实例被标记为常量时，该实例的其他属性也均为常量。
let rangeOfFourItems2 = FixedLengthRange(firstValue: 0, length: 4)
// rangeOfFourItems.firstValue = 6
// this will report an error, even though firstValue is a variable property

// 延迟存储属性 lazy
class DataImporter {
    
    //DataImporter is a class to import data from an external file.
    //The class is assumed to take a non-trivial amount of time to initialize.
    
    var fileName = "data.txt"
}
 
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}
 
let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")




//: ### 总结
//:
//: [Next](@next)
