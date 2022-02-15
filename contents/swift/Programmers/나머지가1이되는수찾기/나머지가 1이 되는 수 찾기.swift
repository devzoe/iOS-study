//n을 x로 나눈 나머지가 1이 되도록 하는 가장 작은 자연수 x를 return 하도록 solution 함수
import Foundation

func solution(_ n:Int) -> Int {
    var d = n - 1
    var div = 2

    while d % div != 0 {
        div += 1
    }

    return div
}

func solution2(_ n:Int) -> Int {
    return (1...n).filter{n % $0 == 1}.min()!
}
