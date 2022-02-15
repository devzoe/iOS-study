func solution(_ phone_number:String) -> String {
    var arr = Array(phone_number)
    var arr2 = [Character](repeating: "*", count: (arr.count-4))
    
    arr.removeFirst(arr.count-4)
    arr2 += arr
    
    return String(arr2)
}

func solution2(_ phone_number:String) -> String {
    return String(repeating:"*", count:phone_number.count-4)+phone_number.suffix(4)
    //suffix(_:) 뒤에서 부터 몇 글자만큼
}
