import Foundation

func solution(_ n:Int) -> Int {
    var cnt = 0
    
    for i in 2...n {
        if isPrime(i) == true {
            cnt += 1
        }
    }
    return cnt
}
func isPrime(_ n:Int) -> Bool{
    if n <= 1{
        return false
    }
    if n%2 == 0{
        return n==2 ? true: false
    }
    
    for i in stride(from: 3, through: Int(sqrt(Double(n))), by: 2){
        if( n % i == 0){
            return false
        }
    }
    return true
}
