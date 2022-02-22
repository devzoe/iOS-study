func solution(_ s:String, _ n:Int) -> String {
    var str = Array(s)
    var answer = ""
    let alpha = Array("abcdefghijklmnopqrstuvwxyz")
    let upAlpha = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    
    for i in str {
        if i == " " {
            answer += " "
        }
        if alpha.contains(i){
            var idx = alpha.firstIndex(of: i)! + n
            if idx > 25{
                answer.append(alpha[idx-26])
            }
            else{
                answer.append(alpha[idx])
            }
        }
        else if upAlpha.contains(i) {
            var idx = upAlpha.firstIndex(of: i)! + n
            if idx > 25{
                answer.append(upAlpha[idx-26])
            }
            else{
                answer.append(upAlpha[idx])
            }
        }
    }
    return answer
}
