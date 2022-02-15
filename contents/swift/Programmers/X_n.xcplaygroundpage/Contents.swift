func solution(_ x:Int, _ n:Int) -> [Int64] {
    var temp = [Int64]()

    for i in 1...n {
        temp.append(Int64(i * x))
    }

    return temp
}

func solution2(_ x:Int, _ n:Int) -> [Int64] {
    return Array(1...n).map { Int64($0 * x) }
}
