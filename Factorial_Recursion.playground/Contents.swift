//: Playground - noun: a place where people can play

import UIKit

///Find the factorial of number n

func factorial(number: Int) -> Int{
  print("Executing \(number)")
  if number == 0 {
    print("Executing 1")
    return 1
  }
  else {
    print("Executing \(number) and \(number - 1)")
    return number * factorial(number: number - 1)
  }
}

print(factorial(number: 5))
