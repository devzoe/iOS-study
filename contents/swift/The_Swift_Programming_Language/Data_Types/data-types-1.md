# Swift 데이터 타입 기본

🌟 모든 데이터 타입 이름은 첫 글자가 대문자로 시작하는 `대문자 카멜케이스`를 사용

## ✅ Int와 UInt

- 정수 타입 
- `Int` : +, - 부호를 포함한 정수
- `UInt` : - 부호를 포함하지 않는 0을 포함한 양의 정수

🚨 `주의` : 스위프트는 데이터 타입에 굉장히 엄격. 같은 정수라 하더라도 Int와 UInt를 완전히 다른 타입으로 인식. 따라서 코드 안에 Int와 UInt 두 타입을 모두 사용하면 정수 타입의 변수끼리도 값을 교환할 때 `많은 자원을 소모`할 수 있음

## ✅ Bool

```swift
var boolean: Bool = true
```
- `Bool` : true 또는 false 만 값으로 가짐.


## ✅ Float과 Double

```swift
var floatValue: Float = 1234567890.1 //Float이 수용할 수 있는 범위 넘어섬
let double: Double = 1234567890.1 //Double은 가능
floatValue = 123456.1 //수용 가능
```
- 실수, 부동소수 타입
- `Float` : 32비트 부동소수 표현, 6자리의 숫자까지만 표현
- `Double` : 64비트 부동소수 표현

## ✅ Character
```swift
let alphabetA: Character = "A"
let commandCharacter = "♡"
let 한글변수이름: Character = "ㄱ"
//한글도 유니코드 문자에 속하므로 스위프트 코드의 변수 이름으로 사용 가능.
```
- 단 하나의 문자
- 유니코드 9 문자를 사용

## ✅ String

```swift
//상수로 선언된 문자열은 변경 불가
let name: String = "jay"

//이니셜라이저를 사용하여 빈 문자열을 생성
//var 키워드를 사용하여 변수 생성하면 수정 및 변경 가능
var introduce: String = String()

//append() 메서드를 사용하여 문자열을 이어붙임
introduce.append("제 이름은")

// + 연산자를 통해서 문자열을 이어 붙일 수 있음
introduce = introduce + " " + name +"입니다."

//name에 해당하는 문자의 수를 셀 수 있음
print("name의 글자 수: \(name.count)")

//빈 문자열인지 확인해 볼 수 있음
print("introduce가 비어있습니까?: \(introduce.isEmpty)")

```

## ✅ Any, AnyObject와 nil

```swift
var someVar: Any = "jay" //문자열
someVar = 50 //정수
someVar = 100.1 //실수 모두 가능
```

🚨 `주의` : Any 와 AnyObject는 될 수 있으면 사용하지 않기. 타입에 엄격한 스위프트 특성상 Any 또는 AnyObject로 선언된 변수의 값 -> 매번 타입 확인 및 변환을 해줘야 하는 불편함 + 예기치 못한 오류의 위험 증가. 타입은 될 수 있는 한 명시.

- `nil` : '없음'을 나타내는 스위프트 키워드, 비어있음
