//: Playground - noun: a place where people can play

import UIKit

/*****************************************************************************************************************/
//   Remove duplicated elements from an sorted array
/*****************************************************************************************************************/

var inputArray = [1,2,3,3,4,5]

func removeDuplicatesFromSorted(array: inout [Int]) -> [Int] {
  for i in 0..<array.count {
    if array.count > i + 1 {
      if array[i] == array[i + 1] {
        print("Duplicate number is \(array[i])")
        array.remove(at: i)
      }
    }
  }
  return array
}

print(removeDuplicatesFromSorted(array: &inputArray))

/*****************************************************************************************************************/
