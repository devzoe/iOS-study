func solution(_ arr:[Int]) -> [Int] {
    var array = arr
    array.remove(at: array.firstIndex(of: array.min()!)!)//index(of:)함수
    return array.isEmpty ? [-1] : array
}

//강제 추출을 사용하지 않고 구현
func solution2(_ arr:[Int]) -> [Int] {
    let min = arr.sorted(by: <)[0]
     return arr.count == 1 ? [-1] : arr.compactMap({ return $0 != min ? $0 : nil })
}


let array = [4,3,2,1]
print(solution(array))
print(solution2(array))
