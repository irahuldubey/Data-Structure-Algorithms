import UIKit

// Count Prime
private func countPrime(from number: Int) -> Int {
    var count = 0
    for n in 2..<number {
        if isPrime(number: n) {
            count += 1
        }
    }
    return count
}

private func isPrime(number: Int) -> Bool {
    for n in 2..<number {
        if number % n == 0 {
            return false
        }
    }
    return true
}

// Approach 2
private func checkIfNumberIsPrime(number: Int) -> Bool {
  guard number > 1 else {
    return false
  }
  for index in 2...Int(sqrt(Double(number))) {
    if number % index == 0 {
      return false
    }
  }
  return true
}

func primeFactorsOf(number: Int) -> [Int] {
    if number < 4 {
        return [number]
    }
    let lim = Int(sqrt(Double(number)))
    for x in 2...lim {
        if number % x == 0 {
            var result = [x]
            result.append(contentsOf: primeFactorsOf(number: number / x))
            return result
        }
    }
    return [number]
}


// O(N * Log(Log(N)))
 func countPrimes(_ n: Int) -> Int {
    guard n > 2 else { return 0 }
    var primes = Array(repeating: true, count: n + 1)
    primes[0] = false
    primes[1] = false
            
    var p = 2
    while (p * p) <= n {
    if primes[p] {
        for i in stride(from: p * p, through: n, by: p) {
            primes[i] = false
        }
    }
        p += 1
    }
            
    //Necessary because prompt asks for primes below n
    primes[n] = false
    return primes.filter { $0 == true }.count
}




























print("PRIME FACTORS", primeMe(input: 24))

func primeMe(input: Int) -> [Int] {
    guard input != 1 else { return [] }
    var resultList: [Int] = [Int]()
    var current = input
    let result = factor(input: current)
    current = result.remainder
    resultList.append(result.prime)
    return resultList
}

func factor(input: Int) -> (prime: Int, remainder: Int) {
    let end = Int(sqrt(Float(input)))
    if end > 2 {
        for prime in 2...end {
            if input % prime == 0 {
                return (prime, input / prime)
            }
        }
    }
    return (input, 1)
}
