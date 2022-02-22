import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var rates = Array(repeating: 0, count: N + 1)

    for stage in stages {
        for i in 0..<stage {
            rates[i] += 1      // stage가 3 이면 stage 1 2 3 을 시도한게 된다.
        }
    }

    var result = [Int:Double]()
    for i in 0..<N {
        result.updateValue(Double(rates[i] - rates[i + 1]) / Double(rates[i]), forKey: i+1)
    }
    return result.sorted(by: <).sorted(by: {$0.value > $1.value}).map({ $0.key })
}
