# 함수 (Functions)

## ✅ 정의와 호출 (Defining and Calling Functions)
```swift
func greet(person: String) -> String {
 let greeting = "Hello, " + person + "!"
 return greeting
}
```
- `함수 선언` : 가장 앞에 `func` 키워드를 붙이고 `(person: String)` 파라미터와 형 그리고 `-> String` 형태로 반환형을 정의

```swift
print(greet(person: "Anna"))
// Prints "Hello, Anna!"
print(greet(person: "Brian"))
// Prints "Hello, Brian!"
```
- `정의한 함수`에 인자 값을 넣어 `호출`
```swift
func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))
// Prints "Hello again, Anna!"
```
- 메시지를 `결합`하는 부분과 `반환`하는 부분을 합쳐서 더 짧게 구현
## ✅ 함수 파라미터와 반환 값 (Function Parameters and Return Values)
### 1️⃣ 파라미터가 없는 함수 (Functions Without Parameters)
```swift
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
// Prints "hello, world"
```
### 2️⃣ 복수의 파라미터를 사용하는 함수 (Functions With Multiple Parameters)
```swift
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))
// Prints "Hello again, Tim!"
```
### 3️⃣ 반환 값이 없는 함수 (Functions Without Return Values)
```swift
func greet(person: String) {
    print("Hello, \(person)!")
}
greet(person: "Dave")
// Prints "Hello, Dave!"
```
🚨 주의 : 엄밀히 말하면 위 함수는 반환 값을 선언하지 않았지만 반환 값이 있음. 반환 값이 정의 되지 않은 함수는 `Void`라는 특별한 형을 반환. `Void`는 간단히 `()`를 사용한 `빈 튜플`

```swift
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
// prints "hello, world" and returns a value of 12
printWithoutCounting(string: "hello, world")
// prints "hello, world" but does not return a value
```
- `함수의 반환 값`은 위와 같이 `호출`될 때 `무시`될 수 있음

### 4️⃣ 복수의 값을 반환하는 함수 (Functions with Multiple Return Values)
```swift
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
```
- `튜플`을 `함수의 반환 값`으로 사용할 수 있음

```swift
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"
```
- `반환 값의 인자`를 `반환 값을 접근하는 접근자`로 `사용`할 수 있음
### 5️⃣ 옵셔널 튜플 반환형 (Optional Tuple Return Types)
```swift
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
```
- 위의 반환 값과 달리 반환 값에 `?` 물음표가 붙음. `(min: Int, max: Int)?`
```swift
//옵셔널 체인을 사용
if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
// Prints "min is -6 and max is 109"
```
- 실제 반환 값에 접근하기 위해서는 `if let`과 같은 `옵셔널 체인`을 사용하거나 `강제 unwrapping`을 해야 함. 
### 6️⃣ 함수 인자 라벨과 파라미터 이름 (Function Argument Labels and Parameter Names)
```swift
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // 함수 내부에서 firstParameterName와 secondParameterName의 인자를 사용합니다.
}
someFunction(firstParameterName: 1, secondParameterName: 2)
```
- 함수 호출시 적절한 `파라미터 이름`을 지정해 `함수 내부`와 `함수 호출`시 `사용`
### 7️⃣ 인자 라벨 지정 (Specifying Argument Labels)
```swift
func someFunction(argumentLabel parameterName: Int) {
    // 함수 안애서 parameterName로 argumentLabel의 인자값을 참조할 수 있습니다.
}
```
- 파라미터 앞에 `인자 라벨`을 지정해 `실제 함수 내부에서 해당 인자를 식별하기 위한 이름`과 `함수 호출시 사용하는 이름`을 `다르게 해서 사용`할 수 있음

```swift
//인자 라벨을 지정해서 함수 내부에서는 hometown으로 값을 제어하고 함수 호출시에는 인자 값으로 from을 사용
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))
// Prints "Hello Bill!  Glad you could visit from Cupertino."
```
### 8️⃣ 인자 생략 (Omitting Argument Labels)
```swift
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // 함수 안에서 firstParameterName, secondParameterName
    // 인자로 입력받은 첫번째, 두번째 값을 참조합니다.
}
someFunction(1, secondParameterName: 2)
```
- 파라미터 앞에 `_`를 붙여 함수 호출시 인자값을 `생략`
### 9️⃣ 기본 파라미터 값 (Default Parameter Values)
```swift
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // 함수 호출시 두번째 인자를 생략하면 함수안에서
    // parameterWithDefault값은 12가 기본 값으로 사용됩니다.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault는 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault는 12
```
- 함수의 파라미터 값에 기본 값`(: Int = 12)`을 설정할 수 있음. `기본 값이 설정 되어 있는 파라미터`는 `함수 호출시 생략`할 수 있음. `기본 값을 사용하지 않는 파라미터를 앞`에 위치 시켜야 함수를 의미있게 사용하기 쉬움.

### 🔟 집합 파라미터 (Variadic Parameters)
```swift
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers
```
- 인자 값으로 특정 형(`type`)의 `집합 값`을 사용할
### 1️⃣1️⃣ 인-아웃 파라미터 (In-Out Parameters)
```swift
//인자 두 값을 변경하는 함수
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
```
- 인자 값을 직접 변경하는 파라미터. 선언을 위해 파라미터 앞에 `inout` 이라는 키워드를 사용.

```swift
//실제로 사용하는 예
//두 변수의 실제 값이 변경
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"
```
- 함수의 인자에 변수를 넣을때 `&` 키워드
- `inout`파라미터는 `포인터`를 넣는다고 생각하면 이해하기 편함
🚨 주의 : `인-아웃 파라미터`는 기본 값을 갖을 수 없고, 집합 파라미터는 `inout`으로 선언될 수 없음. `인-아웃 파라미터`를 사용하는 것은 함수의 반환 값을 사용하지 않고 함수 `scope` 밖에 영향을 줄 수 있는 또 하나의 방법.

## ✅ 함수 형 (Function Types)
```swift
// Int값 두 개를 입력받고 Int를 반환하는 함수
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
```
- 함수의 형은 파라미터 형과(`parameter types`) 반환 형(`return type`)
```swift
//입력 받는 파라미터와 반환 값이 없는 함수
func printHelloWorld() {
    print("hello, world")
}
```
### 1️⃣ 함수 형의 사용 (Using Function Types)
```swift
var mathFunction: (Int, Int) -> Int = addTwoInts
```
- `함수`를 `변수처럼 정의`해서 사용
- 변수 `mathFunction`는 `addTwoInts` 함수의 인자 값과 반환 값이 같음

```swift
//변수에 함수를 할당해 사용한 예
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 5"
```
```swift
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 6"
```
- `multiplyTwoInts` 함수도 `mathFunction`과 함수 형이 같으므로 할당해 사용
```swift
let anotherMathFunction = addTwoInts
// anotherMathFunction is inferred to be of type (Int, Int) -> Int
```
- 변수나 상수에 함수를 할당할 때 직접 함수 형을 선언하지 않아도 `Swift`가 형을 `추론`해(`Type Inferred`) 자동으로 함수를 할당
### 2️⃣ 파라미터 형으로써의 함수 형 (Function Types as Parameter Types)
```swift
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
// Prints "Result: 8"
```
- 파라미터에 함수 형을 사용
### 3️⃣ 반환 형으로써의 함수 형 (Function Types as Return Types)
```swift
//입력한 step에 하나를 더하거나 빼는 함수를 선언
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
```

```swift
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
```
- `backward`함수가 `true`냐 `false`냐에 따라 위에서 선언한 적절한 함수를 반환하는 함수
```swift
//위 함수를 사용
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero는 이제 stepBackward() 함수를 가르키고 있습니다.
```
```swift
print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// 3...
// 2...
// 1...
// zero!
```
- `moveNearerToZero`를 호출할 때마다 `stepBackward()` 함수가 호출돼 입력 값이 `1`씩 줄어들어 결국 `0`이 됨.
## ✅ 중첩 함수 (Nested Functions)
```swift
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero는 이제 중첩 돼 있는 stepForward() 함수를 가르킵니다.
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!
```
- 지금까지 함수는 전역적으로 동작하도록 선언. 함수 중에는 다른 함수 안의 body에서 동작하는 함수가 있는데 이 함수를 중첩 함수(`Nested Function`). 중첩함수는 함수 밖에서는 감춰져 있고 `함수의 body내에서 접근 가능`. 
