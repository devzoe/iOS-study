# 타입 캐스팅
***

🌟 `is`, `as`, `as?`, `as!`

🌟 `타입 캐스팅` : 인스턴스의 "타입"을 확인 하거나, 해당 인스턴스를 슈퍼 클래스나 하위 클래스로 취급하는 방법

🌟 타입 캐스팅을 사용하여 타입이 프로토콜에 적합한지 여부도 확인

## ✅ is : Checking Type 
```swift
표현식 is Type
```

- 타입을 체크하는 연산자로, 런타임 시점에 실제 체크가 이루어짐

- 표현식이 Type과 동일하거나, 표현식이 Type의 서브 클래스인 경우 ➡️ `true`

- 이 외의 경우엔 ➡️ `false`

 - `is` 연산자는 타입을 `체크`하는 연산자로, 반환 값은 `Bool` 형
 
###  1️⃣ 동일한 타입을 확인
```swift
let char: Character = "A"

char is Character       // true
char is String          // false
 
 
let bool: Bool = true
 
bool is Bool            // true
bool is Character       // false
```

### 2️⃣ 표현식이 Type의 서브 클래스인 경우
```swift
class Human { }
class Teacher: Human { }
 
let teacher: Teacher = .init()
teacher is Teacher      // true
teacher is Human        // true
```
- `teacher`이란 인스턴스는 `Human` 클래스의 서브 클래스이기 때문에 `Human`으로 타입 체크를 해도 `true`

```swift
class Human {
    let name: String
    init(name: String) {
        self.name = name
    }
}
class Teacher: Human { }
class Student: Human { }
 
 
let people: [Human] = [
    Teacher.init(name: "kim"),
    Student.init(name: "A"),
    Student.init(name: "B")
]
```
- `Human`이란 클래스가 있고 이 `Human` 클래스를 상속받는 서브클래스 `Teacher`, `Student`가 각각 존재

- `people`이란 배열에, `Teacher` 인스턴스 1개, `Student` 인스턴스 2개를 담았음

🚨 타입에 민감한 `Swift`에서 어떻게 `Teacher` & `Student` 두 개의 타입의 인스턴스를 저장하나 싶겠지만, 이는 `업캐스팅`으로 가능한 것. `Teacher` 과 `Student`의 슈퍼 클래스가 `Human`으로 동일하기에, `Human`이란 클래스로 둘 다 `업캐스팅`한 것

```swift

for human in people {
    if human is Teacher {
        print("teacher : \(human.name)")
    } else if human is Student {
        print("student  : \(human.name)")
    }
}
```
> teacher : kim
student : A
student : B


## ✅ as: Type Casting

```swift
표현식 as  (변환 할)Type
표현식 as? (변환 할)Type
표현식 as! (변환 할)Type
```

- 표현식(의 타입)이 변환할 `Type`과 호환된다면, 변환할 `Type`으로 캐스팅된 인스턴스를 리턴
- 상속 관계인 `업캐스팅(Upcasting)`과 `다운 캐스팅(Downcasting)`에서 사용
- `Any`와 `AnyObjec`t 타입을 사용할 경우, 상속 관계가 아니어도 예외적으로 사용

### 1️⃣ 업캐스팅
```swift
class Human {
    let name: String
    init(name: String) {
        self.name = name
    }
}
class Teacher: Human { }
class Student: Human { }
 
 
let people: [Human] = [
    Teacher.init(name: "kim"),
    Student.init(name: "A"),
    Student.init(name: "B")
]
```
- `Swift`는 타입에 민감한 언어이기 때문에, `people`이란 배열엔 `Type Annotation`으로 선언한 `Human`이란 타입의 인스턴스만 들어갈 수 있음
- `Teacher`, `Student`라는 타입의 인스턴스가 도대체 어떻게 들어간 것?
- 둘의 `슈퍼 클래스`가 `Human`으로 동일하기 때문에, 이 둘을 `Human`이란 클래스로 `업캐스팅` 해서 묶어버린 것

```swift
class Human {
    let name: String = "Zoe"
}
class Teacher: Human {
    let subject: String = "ComputerScience"
}
class Student: Human {
    let grade: Int = 1
}
```

```swift
let human = Teacher.init() as Human
```

- `Teacher` 타입의 `인스턴스`를 생성하지만, 이를 `Human` 타입으로 `업캐스팅`해서 `human`에 저장


```swift
human.name             // Zoe
human.subject          // Value of type 'Human' has no member 'subject'
```

- `업캐스팅` : 서브 클래스의 인스턴스를 슈퍼 클래스의 타입으로 참조하는 것 

```swift
// 1. as를 사용한 업캐스팅
let human1 = Teacher.init() as Human
 
// 2. Type Annotation을 사용한 업캐스팅
let human2: Human = Teacher.init()
```

### 2️⃣ 다운 캐스팅
- 슈퍼 클래스 인스턴스를 `서브 클래스의 타입`으로 참조

- 업캐스팅된 인스턴스를 `다시 원래 서브 클래스 타입`으로 참조할 때 사용

- 다운 캐스팅은 실패할 수있기에 `as?`, `as!` 연산자를 이용


```swift
human.name             // Zoe
human.subject          // Value of type 'Human' has no member 'subject'
```

```swift
var teacher: Teacher = human as! Teacher
```

- `다운 캐스팅` : `Human` 타입으로 업캐스팅된 `human` 변수를 다시 하위 클래스인 `Teacher` 타입으로 변환


```swift
teacher.subject         // "ComputerScience"
```
- `Teacher` 클래스의 멤버인 `subject`에도 접근이 가능


🚨 **다운 캐스팅은 실패할 수 있음** 

```swift
let human: Human = Teacher.init()
var student: Student = human as! Student
```

- Teacher이 아닌, Student로 다운 캐스팅을 해버린 것
- 에러남
- 따라서, Swift는 다운캐스팅에 실패할까봐 업캐스팅과 달리 as에 옵셔널(?,!)이 붙은 것
-  `as?`  : "런타임 시점"에 타입 캐스팅(다운 캐스팅)을 하며, 실패할 경우 nil을 리턴
-  `as!`  : "런타임 시점"에 타입 캐스팅(다운 캐스팅)을 하며, 실패할 경우 에러 발생
- 런타임 시점에 실패한 경우 에러를 발생하므로, 가능하면 as?를 사용하자


```swift
for human in people {
    if let teacher as? Teacher {
        print("teacher : \(teacher.name)")
    } else if let student =  human as? Student {
        print("student  : \(student.name)")
    }
}
```

> teacher : kim
student : A
student : B
