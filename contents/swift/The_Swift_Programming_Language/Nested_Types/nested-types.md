# μ€μ²© νμ
***

π `μ€μ²© νμ` : νμ λ΄λΆμ νμμ μ μνκ³  κ΅¬νν  μ μλλ° μ΄λ κ² νμ λ΄λΆμ μλ‘μ΄ νμμ μ μΈν΄ μ€ κ²

π ν΄λμ€ λ΄λΆμ μλ‘μ΄ ν΄λμ€, μλ‘μ΄ κ΅¬μ‘°μ²΄, μλ‘μ΄ μ΄κ±°νμ μ μν  μ μκ³  λ°λλ‘ κ΅¬μ‘°μ²΄ λ΄λΆμ μλ‘μ΄ μ΄κ±°ν λ±μ νμμ μ€μ²©ν΄μ μ νμμΌλ‘ μ μν  μ μμ.

```swift
//ν΄λμ€ νμ μμ μλ‘μ΄ μ΄κ±°ν νμ μ μΈ
class Person {
    enum Job {
        case jobless, programmer, student
    }
    var job: Job = .jobless
}
//ν΄λμ€ νμ μμ μλ‘μ΄ μ΄κ±°ν νμ μ μΈ
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


- `Person`μ΄λΌλ ν΄λμ€ μμ `Job`μ΄λΌλ μ΄κ±°ν νμμ μλ‘­κ² μ μΈν΄μ£Όμκ³  `Student`ν΄λμ€λ `Person`ν΄λμ€λ₯Ό μμλ°κ³  μμ `School`μ΄λΌλ μ΄κ±°ν νμμ μλ‘­κ² μ μΈ

- μ€μ²© λ°μ΄ν° νμμ μ¬μ©ν  λλ μμ μ λλ¬μΌ νμ(μ¬κΈ°μλ `Person`, `Student`νμ)μ μ΄λ¦μ μμ λ³΄λ€ μμ μ μ΄μ€μΌ ν¨

- μλ₯Ό λ€λ©΄ `Person`ν΄λμ€ λ΄λΆμ μ μ `Job`νμμ λνλ΄λ €λ©΄ `Person.Job`μ΄λΌκ³  νννκ³  `Student`μ μλ `School`νμμ λνλ΄λ €λ©΄ `Student.school`μ΄λΌκ³  νν

- `personJob` μμλ₯Ό μ μΈν `Person.Job`νμκ³Ό `Student.Job` μμλ₯Ό μ μΈν `Student.Job`νμμ λμΌνκ² μ¬μ©. κ·Έ μ΄μ λ `Job`μ΄κ±°ν νμμ `Person`λ΄λΆμλ μ μλμμ§λ§ `Person`μ μμλ°μ `Student`ν΄λμ€μ μ€μ²© λ°μ΄ν° νμμΌλ‘λ μ·¨κΈν  μ μκΈ° λλ¬Έ

 

##  β μ΄λ¦μ΄ κ°μ λ°μ΄ν° νμμ΄μ§λ§ κ° κ΅¬μ‘°μ²΄μ λ§κ² μ μλ κ²½μ°

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
            return GameInfo(location: "μ¬μ£Ό", package: "SA")
        }
    }
}

var basketball: Sports = Sports(gameType: .basketball)
print(basketball.gameInfo) //(time:40, player:5)

var sudden: Esports = Esports(gameType: .offline)
print(sudden.gameInfo) // location: "μ μ£Ό",package: "SA"

let someGameType: Sports.GameType = .football
let anotherGameType: Esports.GameType = .online
```

 - `Sports`μ `Esports` κ΅¬μ‘°μ²΄λ `GameType` μ΄κ±°νκ³Ό `GameInfo` κ΅¬μ‘°μ²΄λ₯Ό λͺ¨λ λ€ κ°μ§κ³  μμ§λ§ κ° κ΅¬μ‘°μ²΄μ λ§κ² μλ‘ λ€λ₯Έ μ’λ₯μ κ²μμ΄ μμΌλ―λ‘ μ κ³΅ν΄μΌ νλ κ²μ μ λ³΄λ μλ‘ λ€λ₯Έ κ²μ νμΈ

- λ§μ½ `GameType`κ³Ό `GameInfo`νμμ μΈλΆμμ μ μνλ€λ©΄ μ΄ λ μ΄κ±°ν νμμ κ³΅ν΅μΌλ‘ μ°μ§ λͺ»νκ³  μ€νλ € λ λ³΅μ‘

- λ°λΌμ μ μμ μ²λΌ κ°μ μ΄λ¦μ νμμ λ€λ₯Έ νμμ λ΄λΆμ μ€μ²©νμ¬ κ΅¬νν κ²κ³Ό κ°μ΄ λͺ©μ μ λ°λΌ νμμ μ€μ²©νλ κ²μ νμμ λͺ©μ μ±μ λͺννκ² νλλ° λμ

 
