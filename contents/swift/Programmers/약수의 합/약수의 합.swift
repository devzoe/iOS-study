func solution(_ n:Int) -> Int {
  var sum = 0
  guard n > 0 else { return sum }
  for i in 1...n {
    if n % i == 0 {
      sum += i
    }
  }
  return sum
}

func solution2(_ n:Int) -> Int {
    guard n != 0 else {
        return 0
    }
    return Array(1...n).filter{n % $0 == 0}.reduce(0, +)
}
