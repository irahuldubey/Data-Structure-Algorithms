//: Playground - noun: a place where people can play

import UIKit

func findFirstDuplicate(array: [Int]) -> Int? {
  guard array.count > 0 else {
    return nil
  }
  var hashArray =  [Int]()
  for (index, value) in array.enumerated() {
    if index < array.count {
      if hashArray.contains(value) {
        return value
      }
      else {
        hashArray.append(value)
      }
    }
  }
  return nil
}

print(findFirstDuplicate(array: [3,1,7,8,4,4]))


