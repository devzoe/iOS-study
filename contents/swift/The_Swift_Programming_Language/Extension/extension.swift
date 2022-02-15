
//Extensions
//- 기능 추가, 확장
//- 오버라이드는 불가능

//extension SomeType: SomeProtocol, AnotherProtocol {
//    //implementation of protocol
//}
//
//-> generic 타입으로 확장하는데 사용

import UIKit

//타입에 계산된 프로퍼티를 추가

extension Double {
    var km: Double { return self / 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// Prints "One inch is 0.0254 meters"
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// Prints "Three feet is 0.914399970739201 meters"


let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")
// Prints "A marathon is 42195.0 meters long"

//Initializers (초기화)
//새로운 이니셜라이저를 추가할 수 있지만 지정된 이니셜라이저나 디이니셜라이저는 추가할 수 없음

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}
//기본적인 이니셜라이저
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
   size: Size(width: 5.0, height: 5.0))
//이니셜라이저 확장
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)

//메소드
//타입에 인스턴스 메소드나 타입 메소드 추가
extension Int {
    func repetitions(task: () -> Void) { //반환값이 없는 함수
        for _ in 0..<self {
            task()
        }
    }
}
3.repetitions {
    print("Hello!")
}
// Hello!
// Hello!
// Hello!

//변경 가능한 인스턴스 메소드
//자기 자신(self)를 변경하는 인스턴스 메소드는 반드시 mutating으로 선언
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()
// someInt is now 9

//서브스크립트 추가
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
        // 10 * n번째 수로 현재 수를 나눈 것의 나머지
      // 1인 경우 746381295 % 10 -> 5가 나머지
      // 2인 경우 746381295 % 10 -> 9가 나머지
    }
}
746381295[0]
// returns 5
746381295[1]
// returns 9
746381295[2]
// returns 2
746381295[8]
// returns 7
746381295[9]
// 9로 처리할 수 있는 자릿 수를 넘어가면 0을 반환

//중첩 타입
//Int안에 enum 중첩
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
// Prints "+ + - 0 - 0 + "

