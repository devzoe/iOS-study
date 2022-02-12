# Enumerations

### 열거형 문법

enum CompassPoint {

case north

case south

case east

case west

}

or

enum Planet {

case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune

}

var directionToHead = CompassPoint.west

directionToHead = .east

### 관련 값

enum Barcode {
case upc(Int, Int, Int, Int)
case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

case안의 관련 값이 전부 상수이거나 변수일 때

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."

### Raw 값

enum Planet: Int {
case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

→자동으로 venus = 2, earth = 3으로 갖게 됨

let earthsOrder = Planet.earth.rawValue

let possiblePlanet = Planet(rawValue: 7)

### 재귀 열거자

다른 열거 인스턴스를 값으로 갖는

enum ArithmeticExpression {
case number(Int)
indirect case addition(ArithmeticExpression, ArithmeticExpression)
indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
