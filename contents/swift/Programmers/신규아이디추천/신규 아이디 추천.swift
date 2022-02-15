import Foundation

func solution(_ new_id:String) -> String {
    var answer = new_id
    
    answer = step1(id: answer)
    answer = step2(id: answer)
    answer = step3(id: answer)
    answer = step4(id: answer)
    answer = step5(id: answer)
    answer = step6(id: answer)
    answer = step7(id: answer)
    
    return answer
}

func step1(id:String) -> String {
    
    return id.lowercased()
}

func step2(id:String) -> String {
    let specialCharaters = ["-","_","."]
    return id.filter{$0.isLetter || $0.isNumber || specialCharaters.contains(String($0))}.map{String($0)}.joined()
}

func step3(id:String) -> String {
    var newId = id
    while newId.contains("..") {
    newId = newId.replacingOccurrences(of: "..", with: ".")
    }
    return newId
}

func step4(id:String) -> String {
    var newId = id
    if newId.first == "." {
        newId.removeFirst()
    }
    
    if newId.last == "." {
        newId.removeLast()
    }
    return newId
}

func step5(id:String) -> String {
    
    return id.isEmpty ? "a" : id
}

func step6(id:String) -> String {
    var newId = id
    if newId.count >= 16 {
        newId = String(newId.prefix(15))
        newId = step4(id: newId)
    }
    return newId
}

func step7(id:String) -> String {
    if id.count == 1 {
        return String(id + id + id)
    }else if id.count == 2 {
        return String(id + String(id.last!))
    }
    return id
}

var str = "Star"
print(str)
