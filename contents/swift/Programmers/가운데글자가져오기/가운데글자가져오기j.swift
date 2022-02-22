func solution(_ s:String) -> String {
    var c = s.count
    if c % 2 == 0 {
        var sIdx = s.index(s.startIndex, offsetBy: c/2-1)
        var eIdx = s.index(s.startIndex, offsetBy: c/2)
        return String(s[sIdx...eIdx])
    }
    else {
        return String(s[s.index(s.startIndex, offsetBy: c/2)])
    }
}
