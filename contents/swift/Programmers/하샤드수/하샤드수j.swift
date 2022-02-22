func solution(_ x:Int) -> Bool {
    var s = String(x)
    var num = 0
    
    for i in s {
        num += Int(String(i))!
    }
    
    if x % num == 0 {
        return true
    }
    else {
        return false
    }
}
