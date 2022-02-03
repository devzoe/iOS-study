import Foundation

func solution(_ s:String) -> Bool
{
    
    let arr = Array(s).map {String($0)}
    let cntP = arr.filter{ $0 == "p" || $0 == "P"}.count
    print(cntP)
    let cntY = arr.filter{ $0 == "y" || $0 == "Y"}.count
    print(cntY)
    if cntP == cntY {
        return true
    }
    else {
        return false
    }
}
func solution2(_ s:String) -> Bool
{
    let string = s.lowercased()
    return string.components(separatedBy: "p").count == string.components(separatedBy: "y").count
}

let str = "PyY"
print(solution(str))
print(solution2(str))

