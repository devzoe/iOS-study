//String 타입에서 혹여나 정수타입 또는 부호가 없다면 nil이 나올수 있으므로 ! 추가
func solution(_ s:String) -> Int {
    return Int(s)!
}

//강제 추출하지 않고 구현
func solution2(_ s:String) -> Int {
    if let num = Int(s) {
        return num
    }
    return 0
}


var str : String = "-1234"
print(solution(str))
print(solution2(str))
