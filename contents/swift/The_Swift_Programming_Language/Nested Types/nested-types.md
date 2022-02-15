# 중첩 타입
***

🌟 `중첩 타입` : 타입 내부에 타입을 정의하고 구현할 수 있는데 이렇게 타입 내부에 새로운 타입을 선언해 준 것

🌟 클래스 내부에 새로운 클래스, 새로운 구조체, 새로운 열거형을 정의할 수 있고 반대로 구조체 내부에 새로운 열거형 등의 타입을 중첩해서 새 타입으로 정의할 수 있음.

```swift
//클래스 타입 안에 새로운 열거형 타입 선언
class Person {
    enum Job {
        case jobless, programmer, student
    }
    var job: Job = .jobless
}
//클래스 타입 안에 새로운 열거형 타입 선언
class Student: Person {
    enum School {
        case elementary, middle, high
    }
    var school: School
    
    init(school: School) {
        self.school = school
        super.init()
        self.job = .student
    }
}

let personJob: Person.Job = .jobless
let studentJob: Student.Job = .student

let student: Student = Student(school: .middle)
print(student.job) // student
print(student.school) //middle
```


- `Person`이라는 클래스 안에 `Job`이라는 열거형 타입을 새롭게 선언해주었고 `Student`클래스는 `Person`클래스를 상속받고 안에 `School`이라는 열거형 타입을 새롭게 선언

- 중첩 데이터 타입을 사용할 때는 자신을 둘러싼 타입(여기서는 `Person`, `Student`타입)의 이름을 자신보다 앞에 적어줘야 함

- 예를 들면 `Person`클래스 내부에 정의 `Job`타입을 나타내려면 `Person.Job`이라고 표현하고 `Student`에 있는 `School`타입을 나타내려면 `Student.school`이라고 표현

- `personJob` 상수를 선언한 `Person.Job`타입과 `Student.Job` 상수를 선언한 `Student.Job`타입은 동일하게 사용. 그 이유는 `Job`열거형 타입은 `Person`내부에도 정의되었지만 `Person`을 상속받은 `Student`클래스의 중첩 데이터 타입으로도 취급할 수 있기 때문

 

##  ✅ 이름이 같은 데이터 타입이지만 각 구조체에 맞게 정의된 경우

```swift
struct Sports {
    enum GameType {
        case football, basketball
    }
    var gameType: GameType
    
    struct GameInfo {
        var time: Int
        var player: Int
    }
    
    var gameInfo: GameInfo {
        switch self.gameType {
        case .basketball:
            return GameInfo(time: 40, player: 5)
        case .football:
            return GameInfo(time: 90, player: 11)
        }
    }
}

struct Esports {
    enum GameType {
        case online, offline
    }
    var gameType: GameType
    
    struct GameInfo {
        var location: String
        var package: String
    }
    
    var gameInfo: GameInfo {
        switch self.gameType {
        case .online:
            return GameInfo(location: "www.live.co.kr", package: "LoL")
        case .offline:
            return GameInfo(location: "재주", package: "SA")
        }
    }
}

var basketball: Sports = Sports(gameType: .basketball)
print(basketball.gameInfo) //(time:40, player:5)

var sudden: Esports = Esports(gameType: .offline)
print(sudden.gameInfo) // location: "제주",package: "SA"

let someGameType: Sports.GameType = .football
let anotherGameType: Esports.GameType = .online
```

 - `Sports`와 `Esports` 구조체는 `GameType` 열거형과 `GameInfo` 구조체를 모두 다 가지고 있지만 각 구조체에 맞게 서로 다른 종류의 게임이 있으므로 제공해야 하는 게임 정보도 서로 다른 것을 확인

- 만약 `GameType`과 `GameInfo`타입을 외부에서 정의했다면 이 두 열거형 타입은 공통으로 쓰지 못하고 오히려 더 복잡

- 따라서 위 예제처럼 같은 이름의 타입을 다른 타입의 내부에 중첩하여 구현한 것과 같이 목적에 따라 타입을 중첩하는 것은 타입의 목적성을 명확하게 하는데 도움

 
