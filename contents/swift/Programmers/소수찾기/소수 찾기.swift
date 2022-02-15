//primeNumber
import Foundation

func primeCheck(_ num :Int) -> Int {
    for value in 2..<num {
        if num % value == 0 {
            return Int(0)
        }
        else {
            continue
        }
    }
    return Int(1)
}
func solution(_ nums:[Int]) -> Int {
    var answer = 0
    var sum = 0
        
    for index in 0..<nums.count-2 {
        for secondIndex in index+1..<nums.count-1 {
            for thirdIndex in secondIndex+1..<nums.count {
                sum += nums[index] + nums[secondIndex] + nums[thirdIndex]
                print(sum)
                answer += primeCheck(sum)
                sum = 0
            }
        }
    }
    return Int(answer)

}
//var nums = [Int]()
var nums : [Int] = [1, 2, 7, 6, 4]
var result : Int = solution(nums)
print(result)
