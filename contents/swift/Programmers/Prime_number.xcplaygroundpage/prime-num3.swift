//에라토스테네스의 채 이용
import Foundation
func solution(_ n:Int) -> Int {
    var prime : [Bool] = Array(repeating: true, count: n+1)
    var count : Int = 0
    prime[0] = false
    prime[1] = false
    
    var i : Int = 2
    while i*i<=n{
        if(prime[i] == true){
            for j in stride(from: i*i, through: n, by: i){
                prime[j] = false
            }
        }
        i+=1
    }
    for i in 0..<prime.count{
        if prime[i]{
            count+=1
        }
    }
    return count
}
