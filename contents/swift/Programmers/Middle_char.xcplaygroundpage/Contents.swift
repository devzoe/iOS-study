func solution(_ s:String) -> String {
    
    var text = ""
    
    if s.count % 2 == 0 {
        let startIndex = s.index(s.startIndex, offsetBy: s.count / 2 - 1)
        let endIndex = s.index(s.startIndex, offsetBy: s.count / 2)
        let range = startIndex...endIndex
        
        text = String(s[range])
    } else {
        let startIndex = s.index(s.startIndex, offsetBy: s.count / 2 )
    
        text = String(s[startIndex])
    }
    return text
}
func solution2(_ s:String) -> String {
    if Array(s).count % 2 == 0 {
        return String(Array(s)[(s.count/2)-1...(s.count/2)])
    }else{
        return String(Array(s)[s.count/2])
    }
}
