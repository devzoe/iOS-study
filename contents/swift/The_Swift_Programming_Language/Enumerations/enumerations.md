# 열거형(Enumerations)
***
🌟 연관된 항목들을 묶어서 표현할 수 있는 타입
🌟 배열이나 딕셔너리 같은 타입과 다르게 프로그래머가 정의해준 항목 값 외에는 추가/수정이 불가
🌟 정해진 값만 열거형 값에 속할 수 있음

🌟 다음 같은 경우 요긴하게 사용
➕ 제한된 선택지를 주고 싶을 때 
➕ 정해진 값 외에는 입력받고 싶지 않을 때
➕ 예상된 입력 값이 한정되어 있을 때 

## ✅ 기본 열거형
- `enum` 키워드로 선언

```swift
enum School {
	case primary	// 유치원
    	case elementary	// 초등
    	case middle	// 중등
        case high	// 고등
        case college	// 대학
	case university	// 대학교
    	case graduate	// 대학원

}
```
- `School`이라는 이름을 갖는 열거형에는 `primary`, `element`, `middle`, `high`, `college`, `university`, `graduate`라는 항목이 있음
- 각 항목은 그 자체가 `고유의 값`이며, 항목이 여러 가지라서 나열하기 귀찮거나 어렵다면 한 줄에 모두 표현해 줄 수도 있음

```swift
enum School {
	case primary, elementary, middle, high, college, university, graduate
}
```
```swift
//School 열거형 변수의 생성 및 값 변경
var highestEducationLevel: School = School.university

//위 코드와 정확히 같은 표현
var highestEducationLevel: School = .university

//같은 타입인 School 내부의 항목으로만 highestEducationLevel의 값을 변경해줄 수 있음
highestEducationLevel = .graduate
```

## ✅ 원시 값 (Raw Value)
- 열거형의 각 항목은 자체로도 하나의 값이지만 항목의 `원시 값`도 가질 수 있음
- 특정 타입으로 지정된 값을 가질 수 있다는 뜻
- 특정 타입의 값을 원시 값으로 가지고 싶다면 열거형 이름 오른쪽에 타입을 명시
- 원시 값을 사용하고 싶다면 `rawValue`라는 프로퍼티를 통해 가져올 수 있음

```swift
enum School : String {
	case primary = "유치원"
    	case elementary	= "초등학교"
    	case middle = "중학교"
        case high = "고등학교"
        case college = "대학"
	case university	= "대학교"
    	case graduate = "대학원"
}

let highestEducationLevel: School = School.university
print("저의 최종학력은 \(highestEducationLevel.rawValue) 졸업입니다.")
// 저의 최종학력은 대학교 졸업입니다.

enum WeekDays: Character {
	case mon = "월", tue = "화", wed = "수", thu = "목", fri = "금", sat = "토", sun = "일"
}

let today: WeekDays = WeekDays.fri
print("오늘은 \(today.rawValue)요일입니다.") 
//오늘은 금요일입니다.
```

```swift
//열거형의 원시 값 일부 지정 및 자동 처리
enum School : String {
	case primary = "유치원"
    	case elementary	= "초등학교"
    	case middle = "중학교"
        case high = "고등학교"
        case college 
	case university	
    	case graduate 
}

let highestEducationLevel: School = School.university
print("저의 최종학력은 \(highestEducationLevel.rawValue) 졸업입니다.")
// 저의 최종학력은 university 졸업입니다.

print(School.elementary.rawValue)//초등학교

enum Numbers: Int {
	case zero
    	case one
        case two
        case ten = 10
}

print("\(Numbers.zero.rawValue), \(Numbers.one.rawValue), \(Numbers.two.rawValue), \(Numbers.ten.rawValue)")
//0 ,1, 2, 10
```
 
## ✅ 연관 값
```swift
//연관 값을 갖는 열거형
enum MainDish {
	case pasta(taste: String)
    	case pizza(dough: String, topping: String)
        case chicken(withSauce: Bool)
        case rice
}

var dinner: MainDish = MainDish.pasta(taste: "크림") //크림 파스타
dinner = .pizza(dough: "치즈크러스트", topping: "불고기") // 불고기 치즈크러스트 피자
dinner = .chicken(withSauce: true) // 양념 통닭
dinner = .rice // 밥
```

```swift
//여러 열거형의 응용
enum PastaTaste {
	case cream, tomato
}
enum PizzaDough {
	case cheeseCrust, thin, original
}
enum PizzaTopping {
	case pepperoni, cheese, bacon
}

enum MainDish {
	case pasta(taste: PastaTaste)
    	case pizza(dough: PizzaDough, topping: PizzaTopping)
        case chicken(withSauce: Bool)
        case rice
}

var dinner: MainDish = MainDish.pasta(taste: PastaTaste.tomato)
dinner = MainDish.pizza(dough: PizzaDough.cheeseCrust, topping: PizzaTopping.bacon)
```

## ✅ 항목 순회
```swift 
//CaseIterable 프로토콜을 활용한 열거형의 항목 순회
enum School: CaseIterable {
	case primary
    	case elementary
        case middle
        case high
        case college
        case university
        case graduate
}

let allCases: [School] = School.allCases
print(allCases)
// [School.primary, School.elementary, School.middle, School.high, School.college, School.university, School.graduate]
```
```swift 
//원시값을 갖는 열거형의 항목 순회
enum School : String, CaseIterable {
	case primary = "유치원"
    	case elementary	= "초등학교"
    	case middle = "중학교"
        case high = "고등학교"
        case college = "대학"
	case university	= "대학교"
    	case graduate = "대학원"
}
let allCases: [School] = School.allCases
print(allCases)
// [School.primary, School.elementary, School.middle, School.high, School.college, School.university, School.graduate]
```

```swift
//available 속성을 갖는 열거형의 항목 순회
enum School : String, CaseIterable {
	case primary = "유치원"
    	case elementary	= "초등학교"
    	case middle = "중학교"
        case high = "고등학교"
        case college = "대학"
	case university	= "대학교"
    	@available(iOS, obsoleted: 12.0)
    	case graduate = "대학원"


	static var allCases: [School] = {
		let all: [School] = [.primary, 
    				.elementary, 
    				.middle, 
    				.high, 
    				.college, 
    				.university]
     	   #if os(iOS)
     	   return all
     	   #else
      	   return all + [.graduate]
      	   #endif
       }
}
  
let allCases: [School] = School.allCases
print(allCases)
// 실행환경에 따라 다른 결과
```

```swift
//연관 값을 갖는 열거형의 항목 순회
enum PastaTaste: CaseIterable {
	case cream, tomato
}

enum PizzaDough: CaseIterable {
	case cheeseCrust, thin, original
}
enum PizzaTopping: CaseIterable {
	case pepperoni, cheese, bacon
}

enum MainDish: CaseIterable {
	case pasta(taste: PastaTaste)
   	case pizza(dough: PizzaDough, topping: PizzaTopping)
    	case chicken(withSauce: Bool)
        case rice
        
        static var allCases: [MainDish] {
        	return PastaTaste.allCases.map(MainDish.pasta)
           		+ PizzaDough.allCases.reduce([]) { (result, dough) -> [MainDish] in 
                		result + PizzaTopping.allCases.map { (topping) -> MainDish in 
                        		MainDish.pizza(dough: dough, topping: topping)
                                }
                        }
                        + [true, false].map(MainDish.chicken)
                        + [MainDish.rice]
        }
}

print(MainDish.allCases.count) //14
print(MainDish.allCases) // 모든 경우의 연관 값을 갖는 케이스 컬렉션
```

## ✅ 순환 열거형
```swift 
//특정 항목에 순환 열거형 항목 명시
enum ArithmeticExpression {
	case number(Int)
    	indirect case addition(ArithmeticExpresion, ArithmeticExpresion)
        indirect case multiplication(ArithmeticExpresion, ArithmeticExpresion)
}
```

```swift 
//열거형 전체에 순환 열거형 명시
indirect enum ArithmeticExpression {
	case number(Int)
    	case addition(ArithmeticExpresion, ArithmeticExpresion)
        case multiplication(ArithmeticExpresion, ArithmeticExpresion)
}
```

```swift 
//순환 열거형의 사용
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
	switch expression {
    	case .number(let value):
        	return value
        case .addition(let left, let right):
        	return evaluate(left) + evaluate(right)
        case .multiplication(let left, let right):
        	return evaluate(left) + evaluate(right)
        }
}

let result: Int = evaluate(final)
print("(5 + 4) * 2 = \(result)")
// (5 + 4) * 2 = 18
```
```
