func solution(_ num:Int) -> String {
    if num % 2 == 0 {
        return "Even"
    }
    else {
        return "Odd"
    }
}

func solution2(_ num:Int) -> String {
    let result : String = (num % 2 == 0) ? "Even" : "Odd"

    return result
}


let num = 4
print(solution(num))
print(solution2(num))

