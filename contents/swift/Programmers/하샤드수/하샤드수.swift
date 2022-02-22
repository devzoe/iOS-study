func solution(_ x:Int) -> Bool {
    var number = x
    var result = 0
    
    while number != 0 {
        result += number % 10
        number = number / 10
    }
    
    return x % result == 0 ? true : false
}

func solution2(_ x:Int) -> Bool {
    return x % String(x).reduce(0, {$0+Int(String($1))!}) == 0
}
