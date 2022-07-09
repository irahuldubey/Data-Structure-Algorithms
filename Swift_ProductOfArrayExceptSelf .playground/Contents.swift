import UIKit

// LC:238. Product of Array Except Self

func productExceptSelf(_ nums: [Int]) -> [Int] {
    
    guard nums.count > 0 else { return [] }
    
    var resultArray: [Int] = [Int].init(repeating: 0, count: nums.count)
    
    var prefixArray: [Int] = [Int].init(repeating: 0, count: nums.count)
    var postfixArray: [Int] = [Int].init(repeating: 0, count: nums.count)
    
    for (index, value) in nums.enumerated() {
        if index == 0 {
            prefixArray[index] = value
        } else {
            if nums.count > index - 1 {
                prefixArray[index] = prefixArray[index - 1] * value
            }
        }
    }
    
    for index in (0..<nums.count).reversed() {
        if index == nums.count - 1 {
            postfixArray[index] = nums[nums.count - 1]
        } else {
            postfixArray[index] = postfixArray[index + 1] * nums[index]
        }
    }
    
    for index in 0..<nums.count {
        if index == 0 && nums.count > index + 1 {
            resultArray[index] = postfixArray[index + 1]
        } else if index == nums.count - 1 && nums.count > index - 1 {
            resultArray[index] = prefixArray[index - 1]
        } else {
            resultArray[index] = prefixArray[index - 1] * postfixArray[index + 1]
        }
    }

    return resultArray
}


productExceptSelf1([1,2,3,4])

func productExceptSelf1(_ nums: [Int]) -> [Int] {
    guard nums.count > 0 else { return [] }
    
    var resultArray: [Int] = [Int](repeating: 0, count: nums.count)
 
    var prefix: Int = 1
    var postfix: Int = 1

    for index in 0..<nums.count {
        resultArray[index] = prefix
        prefix = nums[index] * prefix
    }
    
    for index in (0..<nums.count).reversed() {
        resultArray[index] = postfix * resultArray[index]
        postfix = postfix * nums[index]
    }

    return resultArray
}
