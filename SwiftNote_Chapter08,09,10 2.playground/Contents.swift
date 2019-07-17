import UIKit

/*
 Chapter08
 オプショナル型
 */


var str: String? = "🌟💫"
var repeatString: String = ""
var i = 0

while let stamp = str {
    repeatString += stamp
    i += 1
    if i > 10 {
        break
    }
}

//strがnilならスルー
print(repeatString)
//🌟💫🌟💫🌟💫🌟💫🌟💫🌟💫🌟💫🌟💫🌟💫🌟💫🌟💫


/*
 Chapter09
 クラス
 */


//複数のイニシャライザを定義する

class MyClass {
    let msg: String
    let name: String?
    
    init(msg: String = "ハロー") {
        self.msg = msg
        self.name = nil
    }
    
    init(msg: String = "ハロー", name: String) {
        self.msg = msg
        self.name = name
    }
    
    func hello() {
        print(msg)
        print(name)
    }
}

let myClass = MyClass(name: "山田さん")
myClass.hello()
/*
 ハロー
 Optional("山田さん")
 */


// コンビニエンスイニシャライザ

class Sector {
    var r: Double
    var rad: Double
    
    init(r: Double = 1.0, radian: Double = .pi * 2) {
        self.r = r
        self.rad = radian
    }
    
    convenience init(r: Double, degree: Double) {
        let radian = degree * Double.pi / 180.0
        self.init(r: r, radian: radian)
    }
}

let sectorInit = Sector(r: 2, radian: .pi / 4)
let sectorConvinience = Sector(r: 2, degree: 45)

// 指定イニシャライザ
print(sectorInit.rad)
//コンビニエンスイニシャライザ
print(sectorConvinience.rad)
0.7853981633974483
0.7853981633974483


// Computed プロパティとプロパティオブサーバ

class Circle {
    var radius: Double = 1.0
    
    var area: Double {
        get {
            return radius * radius * Double.pi
        }
        
        set(menseki) {
            radius = sqrt(menseki / Double.pi)
        }
    }
    
    // リードオンリープロパティ
    var test: Double {
        return 3
    }
    
    
    
    
}

let myCircle  = Circle()

print("半径\(myCircle.radius)")
//半径1.0
print("面積\(myCircle.area)")
//面積3.141592653589793


myCircle.area *= 2

print("半径\(myCircle.radius)")
//半径1.4142135623730951
print("面積\(myCircle.area)")
//面積6.283185307179588


class Message {
    class func hello() -> String {
        return "こんにちは"
    }
}

let msg = Message.hello()
print(msg)



// アクセス権

// デフォルトでinternal



// chapter10 列挙型と構造体

enum Direction: Int {
    case forward = 2
    case backward
}

let muki1 = Direction.forward.rawValue
let muki2 = Direction.backward.rawValue

print(muki1)
//2
print(muki2)
//3

let muki5 = Direction(rawValue: 3)
if let muki = muki5 {
    print(muki)
    //backward
}



enum Pattern {
    case Monotone(_: PColor)
    case Border(color1: PColor, color2: PColor)
    case Dots(base: PColor, dot1: PColor, dot2: PColor)
}

enum PColor: String {
    case red = "赤"
    case green = "緑"
    case yellow = "黄"
    case white = "白"
}



let shirt1 = Pattern.Monotone(.red)
let shirt2 = Pattern.Border(color1: .white, color2: .red)
let shirt3 = Pattern.Dots(base: .yellow, dot1: .white, dot2: .green)


let patternList = [shirt1, shirt2, shirt3]

for thePattern in patternList {
    switch thePattern {
    case .Monotone(let c):
        print(c)
    //        red
    case .Border(color1: let c1, color2: let c2):
        print(c1,c2)
    //white red
    case let .Dots(base, dot1, dot2):
        let bColor = base.rawValue
        let dc1 = dot1.rawValue
        let dc2 = dot2.rawValue
        print(bColor,dc1,dc2)
        //        黄 白 緑
    }
}



enum Ticket: Int {
    
    case Gold = 1
    case A = 2
    case B = 3
    
    var ticketNumber: Int {
        return self.rawValue
    }
    
    static var name = "入場券"
    
    // 席(リードオンリープロパティ)
    var area: String {
        switch self {
        case .Gold:
            return "ゴールド席"
        case .A:
            return "A席"
        case .B:
            return "B席"
        }
    }
        
        
        // 価格(リードオンリープロパティ)
        var price: Int {
            switch self {
            case .Gold:
                return 24000
            case .A:
                return 3000
            case .B:
                return 2000
            }
        }
    
    static func description() -> String {
        return "3種類のチケットがあります"
    }
    
    func isVip() -> Bool {
        if self == .Gold {
            return true
        } else {
            return false
        }
    }
    
    // 列挙型の自分自身の値を変更するときは　mutating を付加する
    mutating func turn() {
        if self == .A {
            self = .B
        } else {
            self = .A
        }
    }
}

Ticket.name = "腸ライブ入場券"



var ticket1 = Ticket.A

print(ticket1.area)
//A席

print(Ticket.B.price)
//2000


print(ticket1.isVip())
//false

ticket1.turn()
print(ticket1)
//B





//構造体

struct ColorBox {
    var width: Int
    var height: Int
    var color: String
}

struct WhiteBox {
    var width: Int = 100
    var height: Int = 100
    let color: String = "white"
}


let redBox = ColorBox(width: 120, height: 100, color: "red")
let whiteBox = WhiteBox()

print(redBox.color)
//red
print(whiteBox.color)
//white



// イニシャライザがある構造体

struct Box {
    var width: Int
    var height: Int
    var size: String
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        
        // イニシャライズの時に計算される
        if width + height < 250 {
            size = "M"
        } else {
            size = "L"
        }
    }
}

let box1 = Box(width: 200, height: 80)
print(box1)
//Box(width: 200, height: 80, size: "L")



//構造体自身のプロパティ変更

struct Line {
    var p1: Point
    var p2: Point
    
    mutating func move(h: Double, v: Double){
        p1.x += h
        p1.y += v
        p2.x += h
        p2.y += v
    }
    
}

struct Point {
    var x: Double
    var y: Double
}

let point1 = Point(x: 100, y: 100)
let point2 = Point(x: 300, y: 100)

//移動前
print(point2)
//Point(x: 300.0, y: 100.0)

var theLine = Line(p1: point1, p2: point2)

theLine.move(h: 50, v: 20)

//移動後
print(theLine.p1)
//Point(x: 150.0, y: 120.0)

