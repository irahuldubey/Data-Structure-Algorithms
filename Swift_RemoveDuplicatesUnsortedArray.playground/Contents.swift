//: Playground - noun: a place where people can play

import UIKit

//Remove Duplicates from an Unsorted Array.

var unsortedArray = [1,2,4,3,1,6,6]

func removeDuplicatedFromUnsorted(array: [Int]) -> [Int] {
  var dupDictionary: [Int : Int] =  [Int: Int]()
  for arrayValue in 0..<array.count {
    if let _ = dupDictionary[arrayValue] {
      // Discard it..
    }
    else{
      dupDictionary[arrayValue] = 1
    }
  }
  return Array(dupDictionary.keys)
}

print(removeDuplicatedFromUnsorted(array: unsortedArray))
//O(n)


