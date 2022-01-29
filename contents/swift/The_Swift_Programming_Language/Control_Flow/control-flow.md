# Swift 제어문(Control Flow)

🌟 스위프트 제어문 : `while`, `if guard`, `switch`, `for-in`

## ✅ For-In 문(For-In Loops)

- `for-in` : 배열, 숫자의 범위, 문자열을 반복한다.

```swift
//배열 반복
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
	print("Hello, \(name)!")
}
```
💻 출력 :
> Hello, Anna!
Hello, Alex!
Hello, Brian!
Hello, Jack!

```swift
//딕셔너리 반복
let numberOfLegs = ["spider" : 8, "ant" : 6, "cat" : 4]
for (animalName, legCount) in numberOfLegs {
	print("\(animalName)s have \(legCount) legs")
}
```
💻 출력 :
> cats have 4 legs
ants have 6 legs
spiders have 8 legs

- `사전(dictionary)`에서 반환된 `키(key)-값(value)` 쌍으로 구성된 튜플을 순회하며 제어
- `사전(dictionary)`에 담긴 콘텐츠는 `정렬이 되지 않은 상태`. 사전에 넣었던 순서대로 순회되지 않음

```swift
//1,2,3,4,5 반복
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
```
💻 출력 :
> 1 times 5 is 5
 2 times 5 is 10
 3 times 5 is 15
 4 times 5 is 20
 5 times 5 is 25
 
 - `for-in` 문을 순서대로 제어할 필요가 없다면, 변수자리에 `_`키워드를 사용하면 성능을 높일 수 있음
 
```swift
//3의 10제곱
let base = 3
let power = 10
var answer = 1
for _ in 1...power { //사용 안 하면 비워둬도 됨
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
```
💻 출력 :
>3 to the power of 10 is 59049

```swift
//0부터 60까지, 60은 포함하지 않음. 0~59 -> 60번 반복
let minutes = 60
for tickMark in 0..<minutes {
    // render the tick mark each minute (60 times)
}
```

```swift
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}
```
- `stride(from:to:by:)` : from - 시작하는 수, to - 끝나는 수, by - 구간


```swift
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
}
```
- `stride(from:to:by:)` : 다음은 구간을 3으로 설정한 경우


## ✅ While 문(While Loops)

🌟 while loops : `while`, `repeat-while`

### 1️⃣ while
```swift 
while condition {
    statements
}
```
- `조건(condition)`이 `거짓(false)`일 때까지 `구문(statements)`을 반복


![](https://images.velog.io/images/devjay/post/79a6adfe-a62f-4f4b-87df-a8be58157598/image.png)//GAME
🌟GAME RULE
- 25개 정사각형, 0에서 시작하여 25까지 도달하는 것이 목표
- 만약 사다리 시작지점에서 멈추면 사다기 머리로 올라갈 수 있음
- 만약 뱀의 머리에서 멈추면 뱀의 꼬리로 내려가야 함
```swift
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02; 
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08; 

var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
}
print("Game over!")
```
💻 출력(중간에 체크하는 출력문 추가하여 출력) :
>1번째 반복
square : 0 diceRoll : 1
square(square+diceRoll) : 1
square(square+board[square]) : 1
2번째 반복
square : 1 diceRoll : 2
square(square+diceRoll) : 3
square(square+board[square]) : 11
3번째 반복
square : 11 diceRoll : 3
square(square+diceRoll) : 14
square(square+board[square]) : 4
4번째 반복
square : 4 diceRoll : 4
square(square+diceRoll) : 8
square(square+board[square]) : 8
5번째 반복
square : 8 diceRoll : 5
square(square+diceRoll) : 13
square(square+board[square]) : 13
6번째 반복
square : 13 diceRoll : 6
square(square+diceRoll) : 19
square(square+board[square]) : 8
7번째 반복
square : 8 diceRoll : 7
square(square+diceRoll) : 9
square(square+board[square]) : 18
8번째 반복
square : 18 diceRoll : 2
square(square+diceRoll) : 20
square(square+board[square]) : 20
9번째 반복
square : 20 diceRoll : 3
square(square+diceRoll) : 23
square(square+board[square]) : 23
10번째 반복
square : 23 diceRoll : 4
square(square+diceRoll) : 27
Game over!
Program ended with exit code: 0



### 2️⃣ repeat-while
```swift
repeat {
    statements
} while condition
```
- 다른 언어의 `do-while`과 비슷함

```swift
//위의 게임을 repeat-while로 구현
repeat {
    // move up or down for a snake or ladder
    square += board[square]
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
} while square < finalSquare
print("Game over!")
```

## ✅ 조건문(Conditional Statements)
🌟 `if`, `switch` 두 가지 조건문
### 1️⃣ If문
```swift
//if만 사용
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

```
💻 출력 :
>It's very cold. Consider wearing a scarf.

```swift
//else도 사용
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

```
💻 출력 :
>It's not that cold. Wear a t-shirt.

```swift
//else, else-if 사용
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

```
💻 출력 :
>It's really warm. Don't forget to wear sunscreen.


```swift
//else-if만 사용
//아무것도 출력되지 않음
temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}
```
💻 출력 :
>


### 3️⃣ Switch문
```swift
switch some value to consider {
case value 1:
    respond to value 1
case value 2,
     value 3:
    respond to value 2 or 3
default:
    otherwise, do something else
}
```
- `switch` 문의 기본 형태

```swift
//문자를 비교해 처리하는 경우
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

```
💻 출력 :
>The last letter of the alphabet

### 4️⃣ No Implicit Fallthrough

🌟 `C`와 `Objective-C`의 `switch` 구문과는 달리 `Swift`의 `switch`구문은 암시적인 진행을 하지 않음. `C`나 `Objective-C`에서는 `switch ` 구문이 기본적으로 모든 `case`를 순회하여 `default`를 만날 때까지 진행. 그래서 그것을 진행하지 않기 위해 `break`라는 문구를 명시적으로 적음. `Swift`에서는 `break`를 적지 않아도 특정 `case`가 완료되면 자동으로 `switch`구문을 빠져 나옴. 이런 사용법으로 인해 실수로 `break`를 적지않아 의도하지 않은 `case`문이 실행되는 것을 방지.


```swift
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a": // Invalid, case문에 body가 없으므로 에러가 발생.
case "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// 컴파일 에러 발생!
```
- `case` 안에 최소 하나의 `실행 구문`이 반드시 있어야 함.


```swift
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

```
💻 출력 :
>The letter A

- `case` 안에 `콤마(,)`로 구분해서 복수의 `case` 조건을 `혼합(compound)`해 사용

### 5️⃣ Interval Matching
```swift
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

```
💻 출력 :
>There are dozens of moons orbiting Saturn.

- 숫자의 특정 범위를 `조건`으로 사용

### 6️⃣ Tuples
![](https://images.velog.io/images/devjay/post/b2fd8da4-ce4e-40d4-bc8b-7fde07cfe142/image.png)
```swift
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

```
💻 출력 :
>(1, 1) is inside the box

- `튜플`을 `조건`으로 사용
### 7️⃣ Value Bindings
![](https://images.velog.io/images/devjay/post/9f6a1b00-3d4a-42b5-b8ea-b3d432bf82ee/image.png)

```swift
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

```
💻 출력 :
>on the x-axis with an x value of 2

- `value bindings` : 특정 x, y 값을 각각 다른 `case`에 정의하고 그 정의된 상수를 또 다른 `case`에서 사용

### 8️⃣ Where
![](https://images.velog.io/images/devjay/post/63612b3b-ee04-4edc-b839-4cfdf725e5a4/image.png)

```swift
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

```
💻 출력 :
>(1, -1) is on the line x == -y

- `case`에 `where` 조건을 사용

### 9️⃣ Compound Cases
```swift
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

```
💻 출력 :
>e is a vowel

- `case`에 `콤마(,)`로 구분해 `여러 조건을 혼합`해 사용

```swift
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

```
💻 출력 :
>On an axis, 9 from the origin

- 혼합 케이스에서도 `값-바인딩`을 사용
## ✅ 제어 전송 구문(Control Transfer Statements)
🌟 5가지 제어 전송 구문 : `continue`, `break`, `fallthrough`, `return`, `throw`
🌟 제어 전송 구문은 코드의 진행을 계속 할지 말지를 결정하거나, 실행되는 코드의 흐름을 바꾸기 위해 사용

### 1️⃣ Continue
```swift
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    } else {
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)

```
💻 출력 :
>grtmndsthnklk

- `continue`문은 현재 `loop`를 중지하고 다음 `loop`를 수행
### 2️⃣ Break
```swift
let numberSymbol: Character = "三"  // 중국어로 3을 의미하는 문자
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}
```
💻 출력 :
>The integer value of 三 is 3.

- `break`문은 전체 제어문의 실행을 즉각 중지. `break`문은 `loop`나 `switch`문에서 사용

### 3️⃣ Fallthrough
```swift
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

```
💻 출력 :
>The number 5 is a prime number, and also an integer.

- `fallthrough` 키워드는 이후의 `case`에 대해서도 실행. 앞에서 언급했던 것 처럼 `Swift`에서는 한번 특정 `case`를 타면 바로 그 `switch` 문은 종료. 마치 `case` 안에 `break`를 자동으로 넣은 것과 같은 기능. 하지만 이 `fallthrough` 를 사용하면 이 자동으로 `break`가 사용되는 것을 막는 효과.
- `fallthrough` 는 `case` 조건을 확인하지 않고 그냥 다음 `case`를 실행하게 만듭니다.

### 4️⃣ Labeled Statements
```swift
label name: while condition {
    statements
}
```
- `label` 이름과 `while `조건을 넣어 `특정 구문을 실행`하는 구문으로 사용

```swift
gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")
```
- `switch` 문과 함께 사용

## ✅ 이른 탈출(Early Exit)
```swift
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }

    print("Hello \(name)!")

    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }

    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
greet(person: ["name": "Jane", "location": "Cupertino"])
```
💻 출력 :
>Hello John!
I hope the weather is nice near you.
Hello Jane!
I hope the weather is nice in Cupertino.

- `guard`문을 이용해 특정 조건을 만족하지 않으면 이 후 코드를 실행하지 않도록 `방어코드`를 작성
## ✅ 이용가능한 API 버전 확인(Checking API Availability)
```swift
//구문의 기본 형태
if #available(platform name version, ..., *) {
    statements to execute if the APIs are available
} else {
    fallback statements to execute if the APIs are unavailable
}
```
- `Swift`에서는 기본으로 특정 플랫폼 (iOS, macOS, tvOS, watchOS)과 특정 버전을 확인하는 구문을 제공. 이 구문을 활용해 특정 플랫폼과 버전을 사용하는 기기에 대한 처리를 따로 할 수 있음. 

```swift
//실제 사용 예시
if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}
```

