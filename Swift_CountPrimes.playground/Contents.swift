import UIKit

func countPrimes(_ n: Int) -> Int {
      
      if n <= 2 { return 0 }
          
      var primeCountArray = Array.init(repeating: 0, count: n)
      var countPrimes = 0
  
      for index in 2...n-1 {
          if primeCountArray[index] == 0 {
              for subIndex in stride(from: index, to: n, by: index) {
                  primeCountArray[subIndex] = 1
              }
              countPrimes += 1
          }
      }
      return countPrimes
}

print(countPrimes(10))
