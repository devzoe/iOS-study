# Swift 데이터 타입 고급

🌟 서로 다른 타입끼리의 데이터 교환은 꼭 `타입캐스팅(Type-Casting)` = 형변환 을 거쳐야 함. 스위프트에서 값 타입의 데이터 교환은 엄밀히 말하면 타입캐스팅이 아닌 새로운 인스턴스를 생성하여 할당하는 것.


## ✅ 타입 추론

```swift
//타입을 지정하지 않았으나 타입 추론을 통하여 name 은 String 타입으로 선언됨
var name = "Jay"

//정수로 할당하려고 하면 오류 발생
name = 100

```

- `타입 추론` : 특정 타입을 명시하지 않아도 컴파일러가 할당된 값을 기준으로 변수나 상수의 타입을 결정 


## ✅ 타입 별칭

```swift
typealias MyInt = Int
typealias MyDouble = Double

let age: MyInt = 100
let percentage: MyDouble = 99.9
```
- `타입 별칭` : 데이터 타입에 임의로 다른 이름(별칭)을 부여


## ✅ 튜플

```swift
// String, Int, Double 타입을 갖는 튜플
var person: (String, Int, Double) = ("jay", 100, 182.5)

// 인덱스를 통해서 값을 빼 올 수 있음
print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")

// 인덱스를 통해 값을 할당할 수 있음
person.1 = 99
```

- `튜플` : 지정된 데이터의 묶음

```swift

// 튜플 이름 지정
// String, Int, Double 타입을 갖는 튜플
var person: (name: String, age: Int, height: Double) = ("jay", 100, 182.5)

// 요소 이름을 통해서 값을 빼 올 수 있음
print("이름: \(person.name), 나이: \(person.age), 신장: \(person.height)")

// 요소 이름을 통해 값을 할당할 수 있음
person.age = 99
```


## ✅ 배열

🌟 스위프트의 Array는 C언어의 배열처럼 버퍼. 필요에 따라 자동으로 버퍼의 크기를 조절해주므로 요소의 삽입 및 삭제가 자유로움. 

```swift
// 배열의 선언과 생성

// 대괄호를 사용하여 배열임을 표현
var names: Array<String> = ["jay", "lee", "kim", "choi"]

// 배열의 사용

print(names [2]) // kim
names[2] = "jenny" // ②
print(names [2] ) // jenny 
print(names [4] ) // 인덱스의 범위를 벗어났기 때문에 오류가 발생합니다 .

names[4] = "elsa" // 인덱스의 범위를 벗어났기 때문에 오류가 발생합니다 .
names.append("elsa") // 마지막에 elsa 가 추가됩니다 . ③
names.append(contentsOf: [ "john", "max" ] ) // 맨 마지막에 john 과 max 가 추가됩니다 . ④
names.insert("happy", at: 2) // 인덱스 2 에 삽입됩니다 . ⑤
// 인덱스 5 의 위치에 jinhee 와 minsoo 가 삽입됩니다 . ⑥
names.insert(contentsOf: [ "jinhee", "minsoo" ] , at: 5)

print(names [4] ) // choi
print(names.index(of: "jay")) // 0
print(names.index(of: "christal")) // nil 
print(names.first) // jay
print(names.last) // max

let firstItem: String = names.removeFirst() // ⑦
let lastItem: String = names.removeLast() // ⑧
let indexZeroItem: String = names.remove(at: 0) // ⑨

print(firstItem) // jay
print(lastItem) // max 
print(indexZeroItem) // lee
print(names [ 1 ... 3 ] ) // [ "jenny", "choi", "jinhee" ]

```
- `index(of:)` : 해당 요소의 인덱스 알아내기
- `append(_:)` : 맨 뒤에 요소 추가
- `insert(_:at:)` : 중간에 요소 삽입
- `remove(_:)` : 요소 삭제

## ✅ 딕셔너리

```swift
//typealias를 통해 단순하게 표현
typealias StringIntDictionary = [String: Int]

//키는 String 값은 Int 타입인 빈 딕셔너리를 생성
var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()

//딕셔너리의 키와 값 타입을 정확히 명시해줬다면 [:]만으로도 빈 딕셔너리를 생성할 수 있음
var numberForName: [String: Int] = [:]

//초기값을 주어 생성
var numberForName: [String: Int] = ["jay":100, "lee":200, "kim":300]

print(numberForName["lee"]) //200
print(numberForName["minji"]) //nil

print(numberForName.removeValue(forKey: "jay")) //100
```

- `딕셔너리` : 요소들이 순서 없이 키와 값의 쌍으로 구성되는 컬렉션
- 키는 중복 사용 불가
- 각 값에 키로 접근
- 내부에 없는 키로 접근하면 `nil` 반환
- `removeValue(forKey:)` : 키에 해당하는 값이 제거된 후 반환됨


## ✅ 세트(1)

```swift
var names: Set<String> = Set<String>() // 빈 세트 생성
var names: Set<String> = [] // 빈 세트 생성

//Array와 마찬가지로 대괄호 사용
var names: Set<String> = ["jay", "lee", "kim, "choi"]

//세트의 사용
print(names.count) //4
names.insert("jenny") //
print(names.count) //5

print(names.remove("lee")) // lee
print(names.remove("john")) // nil
```

- `세트` : 순서가 중요하지 않거나 각 요소가 유일한 값이어야 하는 경우 사용, 세트의 요소로 해시 가능한 값이 와야 함
- `insert(_:)` : 세트에 요소 추가 
- `remove(_:)` : 해당 요소가 삭제된 후 반환됨


