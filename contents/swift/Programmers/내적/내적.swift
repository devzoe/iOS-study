import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
 
    var result: Int = 0
    for i in 0..<a.count {
        result += a[i]*b[i]
    }
    return result
}

func solution2(_ a:[Int], _ b:[Int]) -> Int {
    return zip(a, b).map(*).reduce(0, +)
    //zip은 2쌍으로 된 시퀀스를 만들 수 있다.
}
