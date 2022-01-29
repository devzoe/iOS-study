func solution(_ s:String) -> Bool {
    if s.count == 4 || s.count == 6 {
        for c in s {
            let ascii = c.asciiValue
            guard ascii! >= 48 && ascii! <= 57 else { //숫자가 아니면 false 반환
                return false
            }
        }
        return true
    }
    else {
        return false
    }
}

func solution2(_ s:String) -> Bool {
    return (Int(s) != nil && (s.count == 4 || s.count == 6)) ? true : false
}

func solution3(_ s:String) -> Bool {
    if s.count == 4 || s.count == 6 {
        guard let num = Int(s) else { return false }
        return true
    }
    return false
}

let s = "1234"
print(solution(s))
print(solution2(s))
print(solution3(s))
