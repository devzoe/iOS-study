# 클로저(Closures)
***

🌟 클로저를 잘 이해해야 스위프트의 함수형 프로그래밍 패러다임 스타일을 명확하게 이해할 수 있음
🌟 클로저, 제네릭, 프로토콜, 모나드 등이 결합해서 스위프트는 강력한 언어가 됨.
🌟 C, Object-C의 블록 또는 다른 언어의 람다와 유사함.
🌟 `클로저(closures)` : 일정 기능을 하는 코드를 하나의 블록으로 모은 것
🌟 함수는 클로저의 한 형태, 이름이 있는 클로저

## ✅ 클로저 표현(Closure Expressions)

### 1️⃣ 정렬 메소드 (The Sorted Method)
```swift
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
```

```swift
//sorted에 backward함수를 전달인자로 보내기
func backward(_ s1: String, _ s2: String) -> Bool {
	return s1 > s2
}
var reversedNames = names.sorted(by: backward)
//reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
```
- `sorted(by: )` : `true`를 반환하면 첫 번째 전달인자가 두 번째 전달인자보다 앞에 옴

➕ `함수`를 `메서드의 전달인자`로 보내는 일은 `함수형 프로그래밍 패러다임`에서는 아주 당연한 일
### 2️⃣ 클로저 표현 문법 (Closure Expression Syntax)
```swift
{( parameters ) -> return type in 
		statements
}
```
- `general form` : 인자로 넣을 `parameters`, 인자 값으로 처리할 내용을 기술하는 `statements` 그리고 `return type`

```swift
//backward대신 클로저를 전달하기
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in 
		return s1 > s2
})
```
- 위의 예제를 클로저 표현으로 대체한 것
- 코드가 간결해지고 직관적

```swift
//바디가 짧으니 한 줄로 표현 가능
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
```
- 클로저의 바디는 `in` 다음 시작
- `inline closure` : 함수로 따로 정의된 형태가 아닌 클로저


### 3️⃣ 문맥에서 타입 추론 (Inferring Type From Context)
```swift
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
```
- `sorted(by:)`의 메소드에서 이미 `(String, String) -> Bool` 타입의 인자가 들어와야 하는지 알기 때문에 클로저에서 이 타입들은 생략 될 수 있음

### 4️⃣ 단일 표현 클로저에서의 암시적 반환 (Implicit Returns from Single-Express Closures)
```swift
//반환 키워드 생략, 모호성 없음
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
```
- s1, s2를 인자로 받아 두 값을 비교한 결과를 반환

### 4️⃣ 인자 이름 축약 (Shorthand Arguments Names)
```swift
reversedNames = names.sorted(by: { $0 > $1 } )
```
- `$`와 `숫자`의 조합으로 표현
- `in` 키워드 사용할 필요 없음

### 5️⃣ 연산자 메소드 (Operator Methods)
```swift
reversedNames = names.sorted(by: >)
```
- 계속되는 축약
- `Swift`의 `String` 타입 연산자에는 `String`끼리 비교할 수 있는 `비교 연산자(>)` 를 구현
- `>` 자체가 함수 이름

## ✅ 후위 클로저(Trailing Closures)
🌟 만약 함수의 마지막 인자로 클로저를 넣고 그 클로저가 길다면 `후위 클로저`를 사용할 수 있음

```swift
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}
```
```swift
//인자 값 입력 부분과 반환 형 부분을 생략
someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})
```

```swift
//전역함수 형태
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}
```
- 함수를 `대괄호 ( { } )`로 묶어 그 안에 처리할 내용을 적으면 됨

🌟 이런 일반적인 전역함수 형태가 사실 클로저를 사용하고 있던 것

```swift
reversedNames = names.sorted() { $0 > $1 }
```
- 앞에 정렬 예제를 후위 클로저를 사용해 표현

```swift
reversedNames = names.sorted { $0 > $1 }
```
- 함수의 마지막 인자가 클로저이고 `후위 클로저`를 사용하면 `괄호()` 생략 가능
```swift
//후위 클로저를 이용해 숫자(Int)를 문자(String)로 매핑(Mapping)
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
// let strings는 타입 추론에 의해 문자 배열([String])타입을 가짐.
// 결과는 숫자가 문자로 바뀐 ["OneSix", "FiveEight", "FiveOneZero"]가 됨.
```
- 배열의 `map(_:)` 메소드를 이용해 특정 값을 다른 특정 값으로 매핑하는 할 수 있는 클로저를 구현
- 각 자리수를 구해서 그 자리수를 문자로 변환하고, 10으로 나눠서 자리수를 바꾸며 문자로 변환하는 것을 반복
-  `number`값은 상수인데, 이 상수 값을 클로저 안에서 변수 `var`로 재정의 했기 때문에 `number`값의 변환이 가능. 기본적으로 함수와 클로저에 넘겨지는 인자 값은 상수

🚨 `digitNames[number % 10]!`에 뒤에 `느낌표(!)`가 붙어있는 것은 `사전(dictionary)`의 `subscript`는 `옵셔널`이기 때문. 사전에서 특정 `key에 대한 값`은 있을 수도 있고 없을 수도 있기 때문에 논리적으로 당연.
## ✅ 값 캡쳐(Capturing Values)
🌟 `클로저`는 특정 문맥의 상수나 변수의 값을 `캡쳐`할 수 있음.(주변 문백을 통해 상수나 변수를 획득) 다시말해 `원본 값이 사라져도` 클로져의 `body`안에서 `그 값을 활용` 가능.
🌟 `중첩 함수(nested function)` : `Swift`에서 값을 `캡쳐` 하는 가장 단순한 형태
```swift
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
```
- `(forIncrement amount: Int)` : 인자 값
- `() -> Int` : 반환 값(함수 객체를 반환)
- 반환 값 => 인자가 없고 Int형의 클로저를 반환한다는 의미

```swift
//위에서 func incrementer 만 보자면
func incrementer() -> Int {
    runningTotal += amount
    return runningTotal
}
```
- `runningTotal`과 `amount`가 없지만 이 함수는 돌아감.
- `runningTotal`과 `amount`가 `캡쳐링` 되서 그런 것.

🚨 `최적화` 이유로 `Swift`는 만약 더 이상 클로저에 의해 값이 사용되지 않으면 그 값을 `복사해 저장하거나 캡쳐링 하지 않음`. `Swift`는 `특정 변수`가 더 이상 필요하지 않을 때 `제거`하는 것과 관련한 모든 `메모리 관리`를 알아서 `처리`.
```swift
//중첩함수 실행
let incrementByTen = makeIncrementer(forIncrement: 10)
```
```swift
incrementByTen()
// 값으로 10을 반환합니다.
incrementByTen()
// 값으로 20을 반환합니다.
incrementByTen()
// 값으로 30을 반환합니다.
```
- `makeIncrementer` 내부의 `incrementer` 함수를 실행하는 메소드를 반환
- 함수가 각기 실행 되지만 실제로는 변수 `runningTotal`과 `amount`가 `캡쳐링` 되서 그 변수를 공유하기 때문에 계산이 `누적`

```swift
//새로운 클로저 생성
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
// returns a value of 7
```
- 다른 클로저이기 때문에 고유의 저장소에 `runningTotal`과 `amount`를 `캡쳐링` 해서 사용

```swift
//이전 클로저 실행
incrementByTen()
// 값으로 40을 반환합니다.
```


## ✅ 클로저는 참조타입(Closures Are Reference Types)
🌟 `incrementBySeven`과 `incrementByTen`은 상수. 함수와 클로저는 참조 타입이기 때문에 `runningTotal`변수를 계속 증가 시킬 수 있음. 함수와 클로저를 상수나 변수에 할당할 때 실제로는 상수와 변수에 해당 함수나 클로저의 `참조(reference)`가 할당. 그래서 만약 한 클로저를 두 상수나 변수에 할당하면 그 두 상수나 변수는 같은 클로저를 `참조`(`함수 포인터`와 유사).

```swift
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
// 50을 반환합니다.
```
- 앞에서 사용했던 클로저를 상수에 할당하고 실행시키면 사용한 클로저의 마지막 상태에서 10을 증가시켜 결과 값으로 50을 반환

## ✅ Escaping Closures
🌟 클로저를 함수의 파라미터로 넣을 수 있는데, 함수 밖(함수가 끝나고)에서 실행되는 클로저 예를들어, 비동기로 실행되거나 `completionHandler`로 사용되는 클로저는 파라미터 타입 앞에 `@escaping`이라는 키워드를 명시해야 함.

```swift
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
```
- 위 함수에서 인자로 전달된 `completionHandler`는 `someFunctionWithEscapingClosure` 함수가 끝나고 나중에 처리
- 만약 함수가 끝나고 실행되는 클로저에 `@escaping` 키워드를 붙이지 않으면 `컴파일 시 오류 발생`

```swift
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()    // 함수 안에서 끝나는 클로저
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 } // 명시적으로 self를 적어줘야 합니다.
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"

completionHandlers.first?()
print(instance.x)
// Prints "100"
```
- `@escaping` 를 사용하는 클로저에서는 self를 명시적으로 언급해야 함

## ✅ Autoclosures
```swift
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// Prints "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"
```
- `let customerProvider = { customersInLine.remove(at: 0) }` 이 클로저 코드를 지났음에도 불구하고 `customersInLine.count` 는 변함없이 5 
- 그 클로저를 실행시킨 `print("Now serving \(customerProvider())!")` 이후에야 배열에서 값이 하나 제거되어 배열의 원소 개수가 4로 줄어듬
- `자동 클로저`는 적혀진 라인 순서대로 바로 실행되지 않고, 실제 사용될 때 `지연 호출`

```swift
//자동클로저를 함수의 인자 값으로 넣는 예제
// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// Prints "Now serving Alex!"
```
- `serve`함수`() -> String` : 인자가 없고, `String`을 반환하는 클로저를 받는 함수
- `함수 실행` : `serve(customer: { customersInLine.remove(at: 0) } )`와 같이 클로저`{ customersInLine.remove(at: 0) }`를 `명시적`으로 직접 넣을 수 있음

```swift
// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
// Prints "Now serving Ewa!"
```
- `@autoclosure` 키워드를 이용해서 보다 간결하게 사용
- `serve`함수의 인자를 받는 부분 `customerProvider: @autoclosure ()`에서 클로저의 인자()앞에 `@autoclosure`라는 키워드. 
- 이 키워드를 붙임으로써 인자 값은 `자동으로 클로저로 변환` 
-  `serve(customer: { customersInLine.remove(at: 0) } )` : `@autoclosure`키워드를 사용했기 때문에 `serve(customer: customersInLine.remove(at: 0))` 이렇게 `{} 없이 사용`. 
- `정리` : 클로저 인자에 `@autoclosure`를 선언하면 함수가 이미 클로저 인것을 알기 때문에 `리턴값 타입과 같은 값`을 넣어줄 수 있음

🚨 `자동클로저`를 너무 남용하면 코드를 이해하기 어려워 질 수 있음. 그래서 문맥과 함수 이름이 `autoclosure를 사용하기에 분명`해야 합니다.

```swift
//자동클로저@autoclosure, 이스케이프@escaping 같이 사용

// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []        //  클로저를 저장하는 배열을 선언
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
} // 클로저를 인자로 받아 그 클로저를 customerProviders 배열에 추가하는 함수를 선언
collectCustomerProviders(customersInLine.remove(at: 0))    // 클로저를 customerProviders 배열에 추가
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// Prints "Collected 2 closures."        // 2개의 클로저가 추가 됨
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")    // 클로저를 실행하면 배열의 0번째 원소를 제거하며 그 값을 출력
}
// Prints "Now serving Barry!"
// Prints "Now serving Daniella!"
```
- `collectCustomerProviders`함수의 인자 `customerProvider`는 `@autoclosure`이면서 `@escaping`로 선언
- `@autoclosure`로 선언됐기 때문에 함수의 인자로 리턴값 `String`만 만족하는 `customersInLine.remove(at: 0)`형태로 함수 인자에 넣을 수 있음
- `collectCustomerProviders`함수가 `종료된 후에 실행`되는 클로저 이기 때문에 인자 앞에 `@escaping` 키워드
