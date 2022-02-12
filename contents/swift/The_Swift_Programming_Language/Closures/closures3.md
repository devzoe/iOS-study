# Closure

### 클로저 표현

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in

return s1 > s2

})

문맥에서 타입 추론

reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )

단일 표현 클로저에서 암시적 반환

reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

인자 이름 축약

reversedNames = names.sorted(by: { $0 > $1 } )

연산자 메소드

reversedNames = names.sorted(by: >)

후위클로저로 표현

reversedNames = names.sorted() { $0 > $1 }

reversedNames = names.sorted { $0 > $1 }

### 후위 클로저

func someFunctionThatTakesAClosure(closure: () -> Void) {

// function body goes here

}

인자 값 입력 부분과 반환 형 생략

someFunctionThatTakesAClosure(closure: {
// closure's body goes here
})

후위 클로저로 표현

someFunctionThatTakesAClosure() {
// trailing closure's body goes here
}

### 값 캡쳐 (Capturing Values)

- 원본 값이 사라져도 클로저의 body안에서 활용 가능
- 중첩함수
- 반환 값이 클로저인 형태 (인자가 없고 Int형의 클로저)

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
var runningTotal = 0
func incrementer() -> Int {
runningTotal += amount
return runningTotal
}
return incrementer
}

→ runningTotal과 amount 캡쳐링

### 참조 타입

- 포인터의 개념

### 이스케이핑 클로저

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {

completionHandlers.append(completionHandler)

}

→ completionHandler는 함수가 끝나고 처리됨

func someFunctionWithNonescapingClosure(closure: () -> Void) {

closure()    // 함수 안에서 끝나는 클로저

}

class SomeClass {

var x = 10

func doSomething() {

someFunctionWithEscapingClosure { self.x = 100 } // 명시적으로 self를 적어줘야 합니다.

someFunctionWithNonescapingClosure { x = 200 }

}}

→ @escaping을 사용하는 클로저에서는 self를 명시적으로 언급해야 함

### 자동클로저

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

→실제 사용될 때 호출 됨

→@autoclosure를 사용하여 명시
