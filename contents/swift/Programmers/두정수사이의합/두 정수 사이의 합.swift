func solution(_ a:Int, _ b:Int) -> Int64 {
     var result = 0
    for t in a<b ? a...b : b...a {
        result += t
    }
    return Int64(result)
}
func solution2(_ a:Int, _ b:Int) -> Int64 {
    return Int64(a + b) * Int64(max(a, b) - min(a, b) + 1) / Int64(2)
}
