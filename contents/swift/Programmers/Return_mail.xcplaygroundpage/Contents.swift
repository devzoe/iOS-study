func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportInfo:[String:Set<String>] = [:]
    var reportCount:[Int] = Array(repeating: 0, count: id_list.count)
    var idNumber:[String:Int] = [:]
    
    for (i,id) in id_list.enumerated() {
        idNumber[id] = i
    }
    
    for r in report {
        let split = r.split(separator: " ")
        let report = String(split[0])
        let reported = String(split[1])
        if reportInfo[reported] == nil {
            reportInfo[reported] = [report]
        }else {
            reportInfo[reported]!.insert(report)
        }
    }
    
    for info in reportInfo {
        if info.value.count >= k {
            for id in info.value {
                reportCount[idNumber[id]!] += 1
            }
        }
    }
    return reportCount
}

func solution2(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reported: [String: Int] = [:]
    var user: [String: [String]] = [:]

    for r in Set(report) {
        let splited = r.split(separator: " ").map { String($0) }
        user[splited[0]] = (user[splited[0]] ?? []) + [splited[1]]
        reported[splited[1]] = (reported[splited[1]] ?? 0) + 1
    }

    return id_list.map { id in
        return (user[id] ?? []).reduce(0) {
            $0 + ((reported[$1] ?? 0) >= k ? 1 : 0)
        }
    }
}
