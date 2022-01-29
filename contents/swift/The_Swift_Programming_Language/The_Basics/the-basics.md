# Swift 기본

## ✅ print()와 dump() 함수

```swift
	struct BasicInformation {
		let name : String
    		var age : Int
	}

	var jayInfo : BasicInformation = BasicInformation(name : "jay", age: 99)

	class Person {
		var height:Float = 0.0
   		var weight:Float = 0.0
 	}
 
 	let jay: Person = Person()
 	jay.height = 170.5
 	jay.weight = 50.5
 
 	print(jayInfo) 
 	/* 출력 결과 
 	BasicInformation(name : "jay", age: 99)
 	*/
 
 	dump(jayInfo)
  	/* 출력 결과
 	▽ BasicInformation
 	- name: "jay"
 	- age: 99
 	*/
 
 	print(jay) 
 	// Person
 
 	dump(jay)
  	/* 출력 결과
 	▽ Person #0
 	- height: 170.5
 	- weight: 50.5
 	*/        
```
- 스위프트 표준 라이브러리에 존재
- `print()` : 디버깅 콘솔에 간략한 정보 출력 -> 인스턴스의 description 프로퍼티에 해당하는 내용 출력
- `dump()` : 인스턴스의 자세한 내부 콘텐츠 출력

## ✅ 문자열 보간법

```swift
	let name: String = "jay"
    	print("My name is \(name)")
```

- 변수 또는 상수 등의 값을 문자열 내에 나타내고 싶을 때 사용
- `\(변수나 상수)`의 형태

## ✅ 주석 

```swift
	//한 줄 주석은 이렇게 표현
```
- 슬래시 두 개 `//`

```swift
	/*
    	여러 줄 주석
    	*/
```
- 슬래시와 별표 `/* */`

```swift
	/* 여러 줄 주석 
    	/* 추가 가능
    	// 한 줄도 가능
    	*/
    	이 부분도 가능
    	*/
```
- 스위프트는 중첩주석 지원

## ✅ 변수와 상수

```swift
	let name: String = "jay"
    	var age: Int = 100
    	var job = "iOS Programmer"
    	let height = 170.5
    	age = 99
    	job = "Writer"
    	name = "루피"
    	print("저의 이름은 \(name)이고, 나이는 \(age)세이며, 직업은 \(job)입니다. 키는 \(height)cm입니다.")
```

- `var` : var [변수명]: [데이터 타입] = [값] 의 형태로 변수 선언
- `let` : let [상수명]: [데이터 타입] = [값] 의 형태로 상수 선언

