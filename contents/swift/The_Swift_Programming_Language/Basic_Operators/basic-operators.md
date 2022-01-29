# Swift 연산자

## ✅ 할당 연산자
- `A = B` : A에 B의 값을 할당. 서로 다른 데이터 타입이면 오류남

## ✅ 산술 연산자
- `A + B`
- `A - B`
- `A * B`
- `A / B`
- `A % B`

🌟 스위프트에서는 부동소수점 타입의 나머지 연산까지 지원함.

## ✅ 산술 연산자
- `A == B`
- `A >= B`
- `A =< B`
- `A > B`
- `A < B`
- `A != B`
- `A === B` : A와 B가 참조 타입일 때 같은 인스턴스를 가리키는지 비교하여 불리언 값을 반환
- `A !== B`
- `A ~= B` : 패턴이 매치되는지 확인하여 불리언 값을 반환

## ✅ 삼항 조건 연산자
- `Question ? A:B` : 참이면 A 거짓이면 B를 반환

## ✅ 범위 연산자
- `A...B` : A부터 B까지의 수를 묶어 범위를 표현, A, B도 포함
- `A..<B` : A부터 B미만
- `A...` : A 이상의 수
- `...A` : A 이하의 수
- `...<A` : A 미만의 수

## ✅ 부울 연산자
- `!B`
- `A && B` 
- `A || B` 


## ✅ 전위 연산자 정의와 구현
 
```swift
//전위 연산자의 정의
prefix operater **

//사용

prefix func ** (value: Int) -> Int {
	return value * value
}

let minusFive: Int = -5
let sqrtMinusFive: Int = **minusFive

print(sqrtMinusFive) // 25
```

## ✅ 후위 연산자 정의와 구현
 
```swift
//후위 연산자의 정의
postfix operater **

//사용

postfix func ** (value: Int) -> Int {
	return value + 10
}

let five: Int = 5
let fivePlusTen: Int = five**

print(fivePlusTen) // 15
```


## ✅ 중위 연산자 정의와 구현
 
```swift
//String 타입의 contains(_:) 사용하기 위해 Fountdation 프레임워크 임포트
import Foundation

infix operater ** : MultiplicationPrecedence

//사용
func ** (lhs: String, rhs: String) -> Bool {
	return lhs.contains(rhs)
}

let helloJay: String = "Hello jay"
let jay: String = "jay"
let isContainsJay: Bool = helloJay ** jay // true
