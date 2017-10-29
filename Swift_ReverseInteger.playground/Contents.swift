//: Playground - noun: a place where people can play

import UIKit

/*
 
 Reverse digits of an integer.
 
 Example1: x = 123, return 321
 Example2: x = -123, return -321
 
 The input is assumed to be a 32-bit signed integer. Your function should return 0 when the reversed integer overflows.
*/


func reverse(_ number: Int) ->  Int {
  
  guard let _ = Int32(exactly: number) else {
    return 0
  }
  
  var arrayOfNumbers = [Int]()
  
  var newNumber: Int = 0
  
  if newNumber > 0 {
    let lastDigit = newNumber % 10
    arrayOfNumbers.append(lastDigit)
    newNumber = newNumber / 10
  }
  
  let finalArray = arrayOfNumbers.reversed()
  
  print(finalArray.enumerated())
  
  return 10
}

reverse(123)