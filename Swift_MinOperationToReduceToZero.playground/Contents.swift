import UIKit

func minOperations(_ nums: [Int], _ x: Int) -> Int {
        
        var target = -x
        for i in nums {
            target = target + i
        }
        
        if target == 0 {
            return nums.count
        }
        
        if target < 0 {
            return -1
        }
        
        var result = -1
        var sum = 0
        var left = 0
        
        for i in 0..<nums.count {
            sum = sum + nums[i]
            while sum > target {
                let leftIndex = left + 1
                sum = sum - nums[leftIndex]
            }
            if sum == target {
                result = max(result, i - left + 1)
            }
        }
        
        return result == -1 ? -1 : nums.count - result
    }
