### 1. **비트 연산자 NOT (Bitwise NOT Operator) [~]**

= 비트를 뒤집는다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ce5997cd-d788-4a7c-89bd-6c5de89286e4/Untitled.png)

```swift
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits  // equals 11110000
```

---

➕복습: Int와 UInt ➕

- Int: +, - 부호를 포함하는 정수
- UInt: - 부호를 포함하지 않는 0을 포함한 양의 정수

- Int, UInt는 각각 8,16,32,64비트 타입이 있다. (즉, Int8, Int16, Int32, Int64 / UInt8, UInt16, UInt32, UInt64)
- 시스템 구조에 따라 Int와 UInt의 타입이 달라진다. 예를 들어, 32비트 아키텍처에서는 Int32가 Int타입이 되고, UInt32가 UInt타입이 된다.

(예시)

var integer: Int = -100

let unsignedInteger: UInt 50 //UInt에는 음수값을 할당할 수 없음

✅ Unit와 Int 선택

Int의 최댓값 이상, UInt의 최댓값 미만을 사용하는 경우 Int타입을 사용하는 것이 바람직함

✅ 진수에 따라 정수 표현하기

2진수: 0b

8진수: 0o

16진수: 0x

(예시)

let binaryInteger: Int = 0b11100

---

### 2. 비트 연산자 AND (Bitwise AND Operator) [&]

= 두 비트가 같으면 1, 다르면 0으로 변환

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5235143e-f25f-4fc0-a121-f6c5579c78e4/Untitled.png)

```swift
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits  // equals 00111100
```

### 3. 비트 연산자 OR (Bitwise OR Operator) [|]

= 두 비트 중 하나라도 1이면 1

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9d25bd5f-b66e-47ff-a34a-1a71e56a5496/Untitled.png)

```swift
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits  // equals 11111110
```

### 4. 비트 연산자 XOR (Bitwise XOR Operator)  [^]

= 두 비트가 같으면 0, 다르면 1

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f9be2a57-b78e-466d-a9d4-4bb163077136/Untitled.png)

```swift
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits  // equals 00010001
```

### 5.  비트 시프트 연산자 (Bitwise Left and Right Shift Operators) [shiftBits <<, >>]

= 비트를 왼쪽  혹은 오른쪽으로 밀기

- 부호가 없는 정수인 경우
    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/920afad1-98e3-4ed5-916d-6355cb7a8ec4/Untitled.png)
    

```swift
let shiftBits: UInt8 = 4   // 00000100 in binary
shiftBits << 1             // 00001000
shiftBits << 2             // 00010000
shiftBits << 5             // 10000000
shiftBits << 6             // 00000000
shiftBits >> 2             // 이모니 00001
```

---

➕ 참고 사항 ➕

✅ 왼쪽(<<)으로 비트를 밀어준다 ⇒ 숫자가 커진다

shiftBits << 2는 숫자에 2^2를 곱해준다는 의미이고,

shiftBits << 5는 숫자에 2^5를 곱해준다는 의미이다.

✅ 오른쪽(>>)으로 비트를 밀어준다 ⇒ 숫자가 작아진다

shiftBits >> 3 는 숫자에서 2^3을 나눠준다는 의미가 된다.

---

- 부호가 있는 정수인 경우
    - 부호가 있는 정수형에서는 최상단의 비트가 부호를 표현
    - 0일때는 **양수** 1일때는 **음수**
    
    ![양의 정수인 경우 맨 앞자리가 0](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c6b99600-0244-44cb-a01b-595792e25123/Untitled.png)
    
    양의 정수인 경우 맨 앞자리가 0
    

![음의 정수인 경우 맨 앞자리가 1 ](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e2c091a3-cdb7-4f08-8b03-128b8235d7f4/Untitled.png)

음의 정수인 경우 맨 앞자리가 1 

![맨 앞자리를 뺀 7비트의 수는 정수 124를 의미한다. 124의 이진수: 1111100, 4의 이진수: 100](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0e49bf1d-eb1c-4d49-bcb2-72c585364cb5/Untitled.png)

맨 앞자리를 뺀 7비트의 수는 정수 124를 의미한다. 124의 이진수: 1111100, 4의 이진수: 100

---

➕ 참고 사항 ➕

4의 이진수는 100이고,

124의 이진수는 1111100이며,

-4의 이진수는 11111100이다.

124와 4는 무슨 관련이 있을까? ⇒ 보수의 개념

✅ -4를 2진수로 표현하고 싶을 때

1. -4의 절댓값(=4)를 8비트 이진수로 만든다 // 0000 0100
2. -4는 음수이므로, 첫번째 자리의 비트를 1로 바꾼다 // 1000 0100
3. 0은 1로, 1은 0으로 바꾼다. (단, 부호비트는 제외) // 1**111 1011**

→ 이 과정이 **1의 보수**를 만드는 것에 해당 된다.

1. 위 결과값에 1을 더한다. // 11111011 + 00000001 = 11111000
    
    cf) 덧셈 방법 참고
    
    ![특정 열(column)의 수를 더해서 2가 될 경우, 왼쪽 열로 1을 ‘자리올림(carried)’ 한다.](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/decda514-e456-441e-afdf-7215fc104975/Untitled.png)
    
    특정 열(column)의 수를 더해서 2가 될 경우, 왼쪽 열로 1을 ‘자리올림(carried)’ 한다.
    

→ 이 과정이 **2의 보수**를 만드는 것에 해당된다. **(2의 보수 = 1의 보수 + 1)**

1.  최종 결과값은 11111000이 된다.

➕ 직관적 변환: 8비트(11111111)의 십진수는 128이고,

128 - 4 = 124 이므로

124의 이진수(1111100)에 부호를 붙인 11111100이 -4의 이진수가 됨

➕ *더 알아보기* 

[*https://st-lab.tistory.com/189*](https://st-lab.tistory.com/189)

[https://life-with-coding.tistory.com/298](https://life-with-coding.tistory.com/298)

*위 링크에는 1의 보수와 2의 보수에 대한 자세한 설명이 있습니다.*

---

![보수의 개념은 결국 비트끼리의 연산을 쉽게 만든다.  더 알아보기 링크에 더 자세한 설명이 있으니 참고!](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/77c505d9-9786-49c5-8fa1-c7986bca67fc/Untitled.png)

보수의 개념은 결국 비트끼리의 연산을 쉽게 만든다.  더 알아보기 링크에 더 자세한 설명이 있으니 참고!

![비트를 왼쪽으로 밀때, 남는 공간은 기본적으로 부호의 비트로 채운다. ](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c7b6c314-ee20-42cf-b6af-55d533950463/Untitled.png)

비트를 왼쪽으로 밀때, 남는 공간은 기본적으로 부호의 비트로 채운다. 

### 6. 오버플로우 연산자 (Overflow Operators)

- Int16의 값의 범위: -32768~32767
- Int16의 최대값인 Int16.max에 값을 하나 더하면 Int16이 저장할 수 있는 값의 범위를 벗어나므로 에러가 발생

```swift
var potentialOverflow = Int16.max
// potentialOverflow equals 32767, which is the maximum value an Int16 can hold
potentialOverflow += 1
// this causes an error
```

만약 값이 넘치는 오버플로우가 발생하더라도 그 뒷 값을 자르고 연산을 수행하려면 각 연산자 앞에 &를 붙이면 된다.

- **오버플로우 덧셈 (&+)**

```swift
var unsignedOverflow = UInt8.max
  // unsignedOverflow equals 255, which is the maximum value a UInt8 can hold
  unsignedOverflow = unsignedOverflow &+ 1
  // unsignedOverflow is now equal to 0
```

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/262737c9-aef0-4ca1-90bb-b1a54b11d7f2/Untitled.png)

UInt8의 최댓값의 경계를 넘게 되어 UInt8의 값은 00000000 즉 0으로 초기화 된다.

- **오버플로우 뺄셈 (&-)**

```swift
var unsignedOverflow = UInt8.min
// unsignedOverflow equals 0, which is the minimum value a UInt8 can hold
unsignedOverflow = unsignedOverflow &- 1
// unsignedOverflow is now equal to 255
```

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/543619df-f6f3-4f12-be07-afdb61d24814/Untitled.png)

UInt8의 최솟값의 경계를 넘게 되어 UInt8의 값은 11111111 즉 255으로 초기화 된다.

- 부호 있는 Int형의 경우

```swift
var signedOverflow = Int8.min
// signedOverflow equals -128, which is the minimum value an Int8 can hold
signedOverflow = signedOverflow &- 1
// signedOverflow is now equal to 127
```

 Int8이 가질 수 있는 최솟값인 10000000으로 초기화된다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9d063238-88b6-4731-8e60-9eaab5d9c460/Untitled.png)

여기에 오버플로 빼기 연산자(&-)를 사용하여 1을 빼면 01111111이 제공되며 부호 비트가 바뀌었으므로 Int8이 가질 수 있는 최댓값인 127을 가지게 된다.

- **연산자 수행의 우선순위 (Precedence and Associativity)**

```swift
2 + 3 % 4 * 5
// this equals 17

2 + ((3 % 4) * 5)
(3 % 4) is 3, so this is equivalent to:
2 + (3 * 5)
(3 * 5) is 15, so this is equivalent to:
2 + 15

```

- **연산자 메소드 (Operator Methods)**

+,++같은 연산자는 메소드로 수행되고 이 메소드를 오버라이딩 할 수 있음

```swift
//구조체에서 더하기 연산자(+)를 구현
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}
```

```swift
//2차원 위치 벡터 (x, y)에 대한 Vector2D 구조체를 정의한 뒤 더하기 연산자를 자체적으로 정의
let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
// combinedVector is a Vector2D instance with values of (5.0, 5.0)
```

> 위의 코드는 구조체에서 더하기 연산자(+)를 구현한 것이다. 더하기 연산자는 두 대상에서 작동하기 때문에 이항 연산자이며 두 대상 사이에서 나타나기 때문에 중위라고 한다. 위의 코드에서는 2차원 위치 벡터 (x, y)에 대한 Vector2D 구조체를 정의한 뒤 더하기 연산자를 자체적으로 정의한다.
> 

> 연산자 메서드는 Vector2D에서 오버로드 할 연산자 (+)와 일치하는 메서드 이름을 가진 타입 메서드로 정의된다. 더하기는 벡터의 필수 동작이 아니기 때문에 Vector2D에 익스텐션으로 정의되었다.
> 

> 연산자 메서드를 다시 보면 left, right 매개변수가 존재하며 이 두 매개변수의 값들을 각각 더해서 새로운 Vector2D 인스턴스를 반환하는 것을 볼 수 있다.
> 

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b33d1c91-5918-4d84-a75a-6297fb8d3c63/Untitled.png)

2차원 벡터 2개가 더해져서 새로운 2차원 벡터를 만드는 것을 볼 수 있다.

- **접두, 접미 연산자 (Prefix and Postfix Operators)**

어떤 피 연산자 앞에 붙이는 접두 연산자를 정의

아래와 같이 -를 붙이면 이후 값을 음수로 변환하도록 함수를 정의합니다.

```swift
//2차원 좌표가 음수로 변하도록 함수를 정의
extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

//음수로 변환된 것을 확인
let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
// negative is a Vector2D instance with values of (-3.0, -4.0)
let alsoPositive = -negative
// alsoPositive is a Vector2D instance with values of (3.0, 4.0)
```

- **할당 연산자의 합성 (Compound Assignment Operators)**

```swift
//할당 연산자를 재정의하는 함수를 만들 수 있다.
//아래 함수는 +=연산자를 재정의 한 예
//+=를 재정의하여 좌표를 더하는 함수
extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}
//좌표가 더해진 것을 볼 수 있다.
var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd
// original now has values of (4.0, 6.0)
```

<aside>
💡 할당 연산자 중에서 기본 할당 연산자 =는 오버라이드 될 수 없다.

</aside>

<aside>
💡 삼중 조건 연산자인 `a ? b : c` 또한 오버로딩 할 수 없다.

</aside>

- **등위 연산자 (Equivalence Operators)**

```swift
//두 값 혹은 객체를 비교하는 등위 연산자 ==를 오버라이딩 가능
//2차원 좌표의 등위를 비교하는 == 연산자를 오버라이딩 한 예
extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

//두 좌표의 x, y가 각각 같은 경우에만 같다고 판별
let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}
// Prints "These two vectors are equivalent."
```

- **커스텀 연산자 (Custom Operators)**

```swift
//기본 연산자에는 커스텀 전위 연산자 +++를 정의해 사용할 수 있음
```

```swift
//이 연산은 자신의 x, y값을 각각 2배하는 연산을 수행하도록 정의
extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
// toBeDoubled now has values of (2.0, 8.0)
// afterDoubling also has values of (2.0, 8.0)
```

- **중위 연산자의 수행 (Precedence for Custom Infix Operators)**

cf. 중위 연산자: 두 피연산자 사이에 존재하는 연산자

```swift
//x 값은 더하고 y 값은 서로 빼는 연산으로 정의
infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
// plusMinusVector is a Vector2D instance with values of (4.0, -2.0)
```
