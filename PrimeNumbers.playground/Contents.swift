//: Playground - noun: a place where people can play

import UIKit


//Check if a number is prime or not

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


let isPrime = checkIfNumberIsPrime(number: 37) //True

print("Is the number is prime", isPrime)

//What is the time complexity for this solution ?  O(sqrt(n))
