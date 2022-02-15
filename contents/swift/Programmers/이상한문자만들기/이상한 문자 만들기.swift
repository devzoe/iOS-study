import Foundation
//각 단어의 짝수번째 알파벳은 대문자로, 홀수번째 알파벳은 소문자로 바꾼 문자열을 리턴하는 함수, solution
func solution(_ s:String) -> String {
    var arr: [String] = []
    var count = 0
    for sIndex in s {
        if count % 2 == 0 {
            arr.append(String(sIndex.uppercased()))
        } else {
            arr.append(String(sIndex.lowercased()))
        }
        count += 1
        if sIndex == " " {
            count = 0
        }
    }
    return arr.joined() //배열 합치기
}

func solution2(_ s:String) -> String {
    let a = s.components(separatedBy: " ").map { $0.enumerated().map { $0.offset % 2 == 0 ? $0.element.uppercased() : $0.element.lowercased() } }
    return a.map{ $0.map { $0 }.joined() }.joined(separator: " ")
}
