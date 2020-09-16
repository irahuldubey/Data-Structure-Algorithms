//: Playground - noun: a place where people can play

import UIKit


//Leet Code 1: 

/*
 
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 
*/

//Solution : Using Hash Map

//Time and Space Complexity is O(n) as we are using one for loop

func twoSum(_ array: [Int], _ target: Int) -> [Int] {

  //Check for the edge case scenario for the array count and positive number.
  guard array.count > 0 else {
    return []
  }

  //Create a Hash Map for the value and position in the array
  
  var indexValueDictionary = Dictionary<Int, Int>()
  
  //Loop through the array 
  
  for (index, value) in array.enumerated() {
    if array.count > index {
      let complement = target - value
      if indexValueDictionary.keys.contains(complement) {
        //Exit condition when we got the match
        return [indexValueDictionary[complement]!, index]
      }
      //Inset the value for the given key as index
      indexValueDictionary[value] = index
    }
  }
  return []
}

print(twoSum([3,2,4], 6))

