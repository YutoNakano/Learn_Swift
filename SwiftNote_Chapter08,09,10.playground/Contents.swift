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
