import UIKit

var str = "Hello, playground"

// Chapter05
//　配列

let zeroList = [Double](repeating: 0.0, count: 10)
let xList = [String](repeating: "未設定", count: 5)

print(zeroList)
print(xList)

/*
 [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
 ["未設定", "未設定", "未設定", "未設定", "未設定"]
 */

let numbers = Array<Int>(5..<10)
print(numbers)
//[5, 6, 7, 8, 9]

print(numbers[1...2])
//[6, 7]


var ageArray = [34,54,12,64,65]
ageArray.sort()
print(ageArray)
//[12, 34, 54, 64, 65]


//ソートした配列を新規作成
var ageArray2 = [34,54,12,64,65,23,98]
let ageArray2Sorted = ageArray2.sorted()
print(ageArray2)
//[34, 54, 12, 64, 65, 23, 98]
print(ageArray2Sorted)
//[12, 23, 34, 54, 64, 65, 98]


let age30to60 = ageArray2.filter({ (age: Int) -> Bool in
    return age >= 30 && age <= 60
})
print(age30to60)
//[34, 54]

let age30to80 = ageArray2.filter { $0 >= 30 && $0 <= 60 }
print(age30to80)
//[34, 54]


let baseNumbers = [10, 20, 30, 40]
let plusOnes = baseNumbers.map({ (num: Int) -> Int in
    return num + 1
})
print(plusOnes)
//[11, 21, 31, 41]


let easyPlusOnes = baseNumbers.map { $0 + 1 }
print(easyPlusOnes)
//[11, 21, 31, 41]


/*
Chapter06
辞書
 */

var sizeTable: [String: Int] = [:]

let tokyometro = ["G": "銀座線", "M": "丸の内線", "H": "日比谷線"]

for (rosenSign, rosenName) in tokyometro {
    print("\(rosenSign)は\(rosenName)")
}
/*
 Hは日比谷線
 Gは銀座線
 Mは丸の内線
 */

/*
 Chapter07
 集合
 */

let colorSet: Set<String> = ["red", "green", "blue", "green"]
print(colorSet)
//重複したものは無視される
//["red", "green", "blue"]
print(type(of: colorSet))
//Set<String>


//和集合
let aSet: Set<String> = ["リンゴ", "みかん", "桃", "イチゴ"]
let bSet: Set<String> = ["イチゴ", "スイカ", "みかん", "バナナ"]

let cSet = aSet.union(bSet)
print(cSet)
//["スイカ", "リンゴ", "桃", "イチゴ", "バナナ", "みかん"]


//積集合
let dSet = aSet.intersection(bSet)
print(dSet)
//["イチゴ", "みかん"]


//完全に一致するか
print(aSet == bSet)
//false


