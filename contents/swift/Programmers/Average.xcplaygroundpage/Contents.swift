func solution(_ arr:[Int]) -> Double {
    var sum : Int = 0
    for value in arr {
        sum += value
    }
    let average : Double = Double(sum) / Double(arr.count)
    return average
}

//reduce 함수
//Swift에서 추론은 아주 강력하며, 코드의 양을 줄여줌
//추론을 이해하지 못하면 코드의 가독성이 떨어짐
//Swift의 표준 배열 라이브러리는 map, filter, reduce라는 세 가지 기능을 제공
func solution2(_ arr:[Int]) -> Double {
    return Double(arr.reduce(0,+))/Double(arr.count)
}

let array : [Int] = [5,5]

print(solution(array))
print(solution2(array))

