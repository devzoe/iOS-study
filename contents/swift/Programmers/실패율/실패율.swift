func solution(_ N:Int, _ stages:[Int]) -> [Int] {
  var countUser: [Int] = [Int](repeating: 0, count: N+1)
  var failureRate: [Double] = []
  var addUsercount = 0
  var result: [Int]  = []
  
  // 1) 각 스테이지별 유저수 카운트 해서 저장하기
  for stage in stages {
    countUser[stage-1] += 1
  }
  
  // 2) 각 스테이지별 실패율 계산해서 저장하기
  for i in 0..<(countUser.count - 1) {
    if countUser[i] == 0 {
      // 도달한 유저가 하나도 없는 경우, 모두가 통과한 경우 -> 실패율 0으로 처리
      failureRate.append(0.0)
    } else {
      failureRate.append((Double(countUser[i]) / Double(stages.count - addUsercount)))
    }
    addUsercount += countUser[i]
  }
  
  // 3) 실패율 높은 순으로 스테이지 저장하기
  for i in failureRate.sorted(by: >) {
    let index = failureRate.firstIndex(of: i)
    var idx = index! + 1
    
    // 실패율이 같은 경우가 있을 때 처리
    if result.contains(idx) {
      for j in 0..<failureRate.count {
        if failureRate[j] == i && !result.contains(j+1) {
          idx = j + 1
          break
        }
      }
    }
    result.append(idx)
  }
  
  return result
}

func solution2(_ N:Int, _ stages:[Int]) -> [Int] {
    var array = Array<Int>(repeating: 0, count: N)
    stages.filter { $0 <= N }.forEach { array[$0 - 1] += 1 }

    return array.reduce(([Double]() ,stages.count)) {
        let rate = Double($1) / Double($0.1)
        return ($0.0 + [rate], $0.1 - $1)

    }.0
        .enumerated()
        .sorted { $0.element > $1.element }
        .map { $0.offset + 1 }
}

func solution3(_ N:Int, _ stages:[Int]) -> [Int] {
    guard N >= 1 && N <= 500 else { return [] }
    var failures: [(stage: Int, count: Int, fail: Float)] = Array(repeating: (0, 0, 0), count: N)

    for i in Array(0..<stages.count) {
        let index = stages[i] - 1
        guard index >= 0 else { continue }
        guard index < N else { continue }
        failures[index] = (stages[i], failures[index].count + 1, 0)
    }

    var usersCount = stages.count
    for i in Array(0..<failures.count) {
        var fail = failures[i]
        fail.stage = i + 1
        fail.fail = usersCount > 0 ? Float(fail.count) / Float(usersCount) : 0
        failures[i] = fail
        usersCount -= fail.count
    }

    let sorted = failures
        .sorted(by: { (s1, s2) in s1.fail == s2.fail ? s1.stage < s2.stage : s1.fail > s2.fail })
        .map({ $0.stage })

    return sorted
}
