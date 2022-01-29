func solution(_ n:Int64) -> Int64 {
    let str : String = String(n)//문자열로 형 변환
    var nums = Array(str).map{ String($0)} //배열로 바꿔줌
    //print(nums)//[1,1,8,3,7,2]
    nums.sort(by : >)//내림차순 정렬 //String도 정렬해주네
    //print(nums)
    
    var answer = String()
    for i in 0..<nums.count {
        answer += nums[i]
    }
    return Int64(answer)!
}
func solution2(_ n:Int64) -> Int64 {
    return Int64(String(String(n).sorted(by: >)))!
}

let num = 118372 //->873211
print(solution(Int64(num)))
print(solution2(Int64(num)))
