func solution(_ n:Int64) -> [Int] {
    let num = String(n)
    var nums = Array(num).map{ Int(String($0))!}
    nums.reverse()
    return nums
}

func solution2(_ n:Int64) -> [Int] {
    return String(n).reversed().map{Int(String($0))!};
}

let value : Int64 = 58679
print(solution(value))
print(solution2(value))
