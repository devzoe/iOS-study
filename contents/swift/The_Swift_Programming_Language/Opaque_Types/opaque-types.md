# Opaque Types
***
- Some은 불투명한 반환 타입(Opaque Type)을 표현하는 Swift의 키워드

- 불투명한 반환 타입 : 반환타입이 잘 안보인다는 뜻. 코드를 은닉해주는 목적때문에 붙여진 이름
- Some이 돌아가는 작동을 생각하면 포괄적 반환 타입이란 말.

 
```swift
var body: some View{
	//코드 내용
}
```

- 위 코드의 의미는 View 프로토콜을 준수하는 모든 타입의 결과가 반환될 수 있다는 말


## ✅ 단순성

- 일반적인 프로그래밍의 경우 다양한 타입을 쓰게될테니 크게 필요성을 느끼지 못하지만 SwiftUI의 경우 크고 작은 View의 조합으로 화면을 구성

- 사용하는 대다수의 객체가 View프로토콜을 준수할 가능성이 높음

- some을 사용하면 View끼리 주고받기가 매우 편리
 

## ✅ 은닉성

- Some : Veiw프로토콜을 준수하면 뭐든지 반환가능하다는 의미라고 했다.

- View프로토콜만 넣어주면 OK이기 때문에 타입의 유추가 불가능

```swift
import SwiftUI
struct ContentView: View { //에러1
	var body: View {//에러2
    	Text("Hello")
        	.padding()
    }
}
```
- 에러1 : 연관 타입을 가진 프로토콜을 사용할 때 타입을 유추할 수 없는 오류
- 에러2 : 이로 인해 뷰 프로토콜의 조건을 만족하지 않아서 발생하는 오류

```swift
@available(...)
public protocol View {
//...
//...
	associatedtype Body : View 
    //...
    @ViewBuilder var body: Self.Body { get }
}
```
- Body 타입에 대한 정보가 필요함

```swift
import SwiftUI
struct ContentView: View { 
	var body: Text {
    	Text("Hello")
        	.padding()
    }
}
```
- Text 타입으로 반환하면 오류 사라짐
- UIKit은 뷰의 설정을 바꾸거나 자식 뷰를 추가한다고 타입이 바뀌진 않지만 SwiftUI의 구현 방식에서는 뷰를 추가할 때 마다 새로운 타입이 만들어짐
- 이것이 불투명 타입을 사용하게 된 이유

- some View와 같은 불투명 타입은 앞에서 본 실제 타입을 반환하는 대신에 타입 정보를 숨기고 프로토콜에 대한 정보만 남긴채 API를 사용하게 도와줌

- 우리는 뷰 프로토콜을 충족하는 어떤 타입이라는 사실만 알고 사용하면 됨

- 제네릭을 반대로 사용하는 것과 같은 개념이기에 리버스 제네릭

## ✅ 타입 추상화

- 제네릭은 코드를 호출하는 측에서 호출되는 측의 타입을 결정

```swift
func genericFunction<T: Animal>(_ animal: T) { ... }
genericFunction(Dog()) //T == Dog , 함수를 호출하는 코드가 타입을 결정
genericFunction(Cat()) //T == Cat
```
- 불투명 타입은 반대로 호출된 코드가 호출한 코드의 타입을 결정

```swift
//호출된 쪽에서 타입을 결정
func opaqueTypeFunction() -> some Animal { Dog() }

//호출한 측은 추상화된 타입을 전달받음
let animal: some Animal = opaqueTypeFunction()
```

## ✅ 정적 타입 시스템

- 제네릭의 매개변수가 그렇듯 불투명 타입 역시 정적 타입에서만 불투명성이 유지되며 런타임에서는 실제타입을 다루는 것처럼 취급하고 사용

```swift
protocol Animal{}

struct Dog: Animal {var color = "brown"}
let dog: some Animal = Dog()

dog.color //컴파일 오류
(dog as! Dog).color //"brown"
```

## ✅ 타입의 정체성

- 기존 프로토콜 반환 타입으로 사용할 땐 유연하지만 함수를 호출할 때마다 서로 다른 타입이 반환될 수 있어 타입에 대한 정보를 잃음

- 하지만 불투명 타입을 이용하면 타입의 정체성을 보존할 수 있음
