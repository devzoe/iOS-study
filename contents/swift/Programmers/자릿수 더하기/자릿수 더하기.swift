func solution(_ n:Int) -> Int
{
    let arr = String(n).map{Int(String($0))!}
    return arr.reduce(0,+)
}

func solution2(_ n:Int) -> Int
{
    return String(n).map{ Int(String($0))! }.reduce(0, +)
}

let value = 123
print(solution(value))
print(solution2(value))
