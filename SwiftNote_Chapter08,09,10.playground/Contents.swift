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
        
    }
}
