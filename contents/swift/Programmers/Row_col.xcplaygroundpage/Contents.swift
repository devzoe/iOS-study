import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var array1 = [Int]()
    var array2 = [[Int]]()
    for i in 0..<arr1.count{
        for j in 0..<arr1[i].count{
            let sum = arr1[i][j] + arr2[i][j]
            array1.append(sum)
        }
        array2.append(array1)
        array1.removeAll()
    }
    return array2
}
func solution2(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    return zip(arr1, arr2).map{zip($0,$1).map{$0+$1}}
}

