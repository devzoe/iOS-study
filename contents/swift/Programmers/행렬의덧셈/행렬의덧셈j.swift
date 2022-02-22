func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result1: [Int] = []
    var result2: [[Int]] = []
    var sum = 0
    
    for i in 0..<arr1.count{
        for j in 0..<arr1[i].count{
            sum = arr1[i][j] + arr2[i][j]
            result1.append(sum)
        }
        result2.append(result1)
        result1.removeAll()
    }
    
    return result2
}
