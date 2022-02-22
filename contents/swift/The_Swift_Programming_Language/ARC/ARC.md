# ARC (Auto Reference Counting)
***
🌟 자동 참조 카운팅 : 효과적으로 `메모리 관리`를 할 수 있게 해주는 도구

>  메모리 관리를 수행하는 이유는 무엇일까?
앱의 성능을 유지하기 위해서는 메모리 관리가 기본인데,
메모리라고 하면 크게 스택 영역,  힙 영역 등이 있다.
이 중 스택 메모리에 저장된 데이터는 value 타입으로, 특별한 관리가 없어도 괜찮다. (자동으로 제거됨)
그러나 힙 메모리에 저장된 데이터는 reference 타입이므로, 개발자가 동적으로 관리해주어야 한다.
(참조 타입의 경우 인스턴스가 참조를 통해 여러 곳에서 접근하므로 언제 메모리가 해제되는지 매우 중요!
적절한 시점에 해제되지 않으면 한정적인 메모리 자원을 낭비하게 되고, 성능 저하로 이어지기 때문이다.)
👉 따라서 힙에 저장된 데이터를 관리할 도구가 필요하고, 
효과적인 메모리 관리를 수행하기 위해 ARC를 이용하는 것이다.

## ✅ retain, release
### 1️⃣ retain

- 객체의 reference count(retain count)를 증가

- 객체가 메모리에서 해제되지 않도록 이 함수를 호출하여 카운트를 증가시키는것

 

### 2️⃣ release

- 객체의 reference count(retain count)를 감소

- 객체를 더이상 필요로 하지 않을 때 이 함수를 호출하여 카운트를 감소시키는 것

 

- 이렇게 ARC는 retain, release의 호출을 통해 메모리 관리를 수행하는 것이고, 이러한 메모리 관리 방법을 Reference Counting(Retain Counting)이라고 함

## ✅ 레퍼런스 카운팅 (Reference Counting)
||클래스 A|클래스 B|클래스 A|클래스 B|
|---|---|---|---|---|
||retain(+1)|retain(+1)|release(-1)|release(-1)|
|count|1|2|1|0|

- compile time에 자동으로 retain, release를 적절한 위치에 삽입하는 방식

🌟 compile time에는 코드를 분석하고 예측하여 적절한 위치에 retain, release를 삽입

🌟 run time에 삽입된 코드가 실행되면서 retain, release에 의해 reference count를 증감하고 count가 0이 되었을 때 메모리에서 제거하는 것!

## ✅ ARC 동작 구현
```swift
import Foundation

class ARC_Example {
    let message: String
    init(message: String) {
        self.message = message
        print("\(message) is being initialized")
    }
    deinit {
        print("\(message) is being deinitialized")
    }
}

// ARC_Example 클래스 타입을 갖는 레퍼런스 변수 2개 A, B
var A: ARC_Example?
var B: ARC_Example?

A = ARC_Example(message: "ARC 동작 코드")
// Prints "ARC 동작 코드 is being initialized"
B = A
//위 과정으로 레퍼런스 카운트 2
A = nil //1
B = nil //0
// Prints "ARC 동작 코드 is being deinitialized"
```
