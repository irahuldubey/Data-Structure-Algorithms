import UIKit

// Iterative method
func search(_ nums: [Int], _ target: Int) -> Int {
    
    var lowerBound = 0
    var upperBound = nums.count
    
    while upperBound > lowerBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        if nums[midIndex] == target {
          return midIndex
        } else if nums[midIndex] < target {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    return -1
}

// Recursive method
func search(_ nums: [Int], _ target: Int, range: Range<Int>) -> Int {
    return -1
}

// 1 2 3 4 5
// 0 ... 4

print(search([1,2,3,4,5], 4))
