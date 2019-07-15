import UIKit

var str = "Hello, playground"

// Chapter03
// 関数


// defer文

func half(num: Double) {
    defer {
        print("計算終了")
    }
    
    guard num >= 10 else { return }
    
    let halfNum = num / 2
    print("\(num)の半分は\(halfNum)")
}
half(num: 8)
//計算終了
half(num: 20)
/*
20.0の半分は10.0
計算終了
*/


// 可変長引数

func sum(numbers: Double...) -> Double {
    var total: Double = 0.0
    //引数はnumbersに配列で入っている
    for num in numbers {
        total += num
    }
    return total
}

let goukei = sum(numbers: 2,4,6,8,10)
print(goukei)
//30.0


// 複数の返り値を持つ関数

func testResult(kokugo: Int, sugaku: Int, eigo: Int) -> (total: Int, average: Double) {
    let total = kokugo + sugaku + eigo
    var ave = Double(total) / 3
    ave = round(ave * 10) / 10
    return (total, ave)
}

let result = testResult(kokugo: 56, sugaku: 87, eigo: 22)
print("合計\(result.0)")
print("平均\(result.average)")
/*
 合計165
 平均55.0
*/



// オーバーロードとは同名の関数であっても、引数や引数の個数、引数の型が違うと、全く別の関数として扱われる




// 引数に外部引数名をつける

func bmi(weight kg: Double, height cm: Double) -> Double {
    if cm == 0 { return -1 }
    var result = kg / pow(cm * 0.01, 2)
    
    result = round(result * 10) / 10.0
    return result
}

print(bmi(weight: 53, height: 170))

//18.3


// Chapter4
// Stringについて

let stars = String(repeating: "😄", count: 10)
print(stars)
// 😄😄😄😄😄😄😄😄😄😄

// 大きさの比較
let str1 = "iPad"
let str2 = "iPhone"

if str1 > str2 {
    print("iPadのほうが大きい")
} else {
    print("iPhoneの方が大きい")
}
// iPhoneの方が大きい


// 前方一致するか
let a = str1.hasPrefix("iPh")
print(a)
//false
//後方一致はhasSuffix()

print(str2.contains("e"))
//true


// 見つかった範囲を削除する

var stri = "東京都千代田区神南1-2-3"

let result1 = stri.range(of: "千代田区")
if let theRange = result1 {
    stri.removeSubrange(theRange)
}
print(stri)
//東京都神南1-2-3




