import UIKit


// チャプター2
//タプル
let product = ("Swift", 2014)
var kingaku = (1000, 80)
var guest: (String, String, Int)
guest = ("大重", "おおしげ", 1234)
print(guest)
// guest = ("やまんば", 9876, "山姥") タプルの型宣言と変わってしまってるのでエラー


let data = (1000, 80)
// 利用しないときアンダースコア
let (price, _) = data
print(price)

var kin = data.0
let tax = data.1
kin = 800
print(kin)

let kingaku3 = (price: 1000, tax: 80)
// ラベルでもインデックスでもどちらでもアクセス可能
let seiyugaku = kingaku3.price + kingaku3.1
print(seiyugaku)


// 演算子

//  Intで計算してるから(10/4)が2扱いになる
let ans = 3 + (10/4)
print(ans)


//2.5にするには他のIntを小数点まで書き、Double型に変換することで型推論が行われる
let ans2 = 3.0 + (10/4)
print(ans2)


// 複合代入演算子

var a = 8
//a &&= b
print(a)

a = 22
a %= 10
print(a)


// 三項演算子

let c = 47
let d = 99

let bigger = (c > d) ? "Cの方がデカい" : "cの方が小さい"
print(bigger)


// 条件式をカンマで区切って並べる

let sugaku = 56
let eigo = 62


// &&で複数の条件式が書けるが、カンマでも実現できる
if sugaku>=50, eigo>=50, (sugaku+eigo)>=120 {
    print("合格")
} else if sugaku == 52 {
    print("数学52点や")
}else{
    print("不合格")
}


// レンジ演算子で振り分ける

for _ in 1 ... 20 {
    let num = arc4random_uniform(50)
    // terminator で改行させずにprintできる
    print("\(num)", terminator: "")
    
    switch num {
    case 10...15:
        print(":交換", terminator: "")
    case 20,(31...35),40:
        print(":再検査", terminator: "")
    default:
        print(": 合格", terminator: "")
    }
}
//8: 合格44: 合格9: 合格18: 合格2: 合格30: 合格33:再検査43: 合格5: 合格5: 合格46: 合格35:再検査30: 合格33:再検査20:再検査41: 合格9: 合格24: 合格41: 合格38: 合格


// バリューバインディング = ケースで表kする値を定数や変数で受け取る

let size = (4, 10)
switch size {
case (0,0):
    print("幅と高さ共に0です")
case (5...10, 5...10):
    print("規定サイズです")
case (5...10, let height):
    print("高さ\(height)が規格外です")
case (let width, 5...10):
    print("幅\(width)が規格外です")
default:
    print("幅高さ共に規定外です")
}
//幅4が規格外です

// 値の振り分けに条件式を使う　where
            //幅　高さ　重さ
let size1 = (45, 40, 100)
switch size1 {
    case let (width, height, _) where (width >= 60) || (height >= 60):
    print("規格外: 幅、高さのどちらかが60以上")
case let (_, _, weight) where (weight >= 80):
    print("規格外: 重さ80以上")
default:
    print("規定サイズ内")
}

//規格外: 重さ80以上


// フォールスルー　fallthrough

var abc = (a: false, b: false, c: false)

let fall = "b"

switch fall {
case "a":
    abc.a = true
    fallthrough
case "b":
    abc.b = true
    fallthrough
case "c":
    abc.c = true
    fallthrough
default:
    print(abc)
}
//(a: false, b: true, c: true)


// 繰り返し処理

let message = "おもてなし"

for i in message {
    print(i)
}
//お
//も
//て
//な
//し

for num in stride(from: 10, to: 50, by: 5) {
    print(num)
}

//10
//15
//20
//25
//30
//35
//40
//45


var tickets = 5
var power = 30

while (tickets > 0) && (power < 100) {
    tickets -= 1
    power += 20
}
print(tickets)
print(power)
//1
//110



// repeatの処理がwhileの条件式に合うまで実行
var f: UInt32, m: UInt32, s: UInt32
var total: UInt32
repeat {
    f = arc4random_uniform(13)+1
    m = arc4random_uniform(13)+1
    s = arc4random_uniform(13)+1
    total = f + m + s
} while total == 21
    print("\(f),\(m),\(s)")
//5,9,6

// continue

let vlist = [3,5,-2,6,-8,2]
var total1 = 0
for v in vlist {
    // 負の値をスキップ
    if v < 0 {
        continue
    }
    total1 += v
    print(v)
}

print("合計\(total1)")
"""
3
5
6
2
合計16
"""

