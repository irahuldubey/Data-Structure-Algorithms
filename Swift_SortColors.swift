//
//  Swift_SortColors.swift
//  
//
//  Created by Rahul Dubey on 6/23/22.
//

func sortColors(_ nums: inout [Int]) {
      guard !nums.isEmpty else { return }
      
      var low = 0
      var mid = 0
      var high = nums.count - 1
      
      while mid <= high {
          let midValue: Int = nums[mid]
          switch midValue {
              case 0:
                  swap(index1: low, index2: mid, from: &nums)
                  low = low + 1
                  mid = mid + 1
                  debugPrint("NUMS 0: \(nums)")
              case 1:
                  mid = mid + 1
                  debugPrint("NUMS 1: \(nums)")
              case 2:
                  swap(index1: mid, index2: high, from: &nums)
                  high = high - 1
                  debugPrint("NUMS 2: \(nums)")
          default:
              debugPrint("Unhandled digits")
          }
      }
  }
   
  func swap(index1: Int, index2: Int, from array: inout [Int]) {
      if index1 != index2 {
         array.swapAt(index1, index2)
      }
  }

var num = [2,0,2,1,1,0]
sortColors(&num)
