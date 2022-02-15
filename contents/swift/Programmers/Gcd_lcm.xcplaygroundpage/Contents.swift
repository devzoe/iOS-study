//최대공약수
func gcd(_ num: Int, _ num2: Int) -> Int {
    let mod: Int = num % num2
    return 0 == mod ? min(num, num2) : gcd(num2, mod)
}
//최소공배수
func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}
 
func solution(_ n:Int, _ m:Int) -> [Int] {
    return [gcd(n, m), lcm(n, m)]
}
