import Foundation

func solution(_ s: String) -> Int {
    let digitNames = [ //딕셔너리 정의
        0: "zero", 1: "one", 2: "two",   3: "three", 4: "four",
        5: "five", 6: "six", 7: "seven", 8: "eight", 9: "nine"
    ]
    
    var newStr = s
    for i in 0...9 { //딕셔너리 값과 문자열 비교 replacingOccurrences함수 사용
        newStr = newStr.replacingOccurrences(of: digitNames[i]!, with: "\(i)")
        //digitNames[i]에 해당하는 문자열이 newStr에 있으면 그걸 i(String 타입)으로 치환해줌
    }

    return Int(newStr)!
    
}

var numberString : String = "one4seveneight" //입력값
 
//문자열을 정수로 바꿔주는 함수 호출
print(solution(numberString))
