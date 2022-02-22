func solution(_ x:Int) -> Bool {
    if x % String(x).map{Int(String($0))!}.reduce(0){$0 + $1} == 0 {
        return true
    }
    return false
}
