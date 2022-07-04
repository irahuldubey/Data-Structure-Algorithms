import UIKit

// Find First and Last Position of Element in Sorted Array

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        
       guard !nums.isEmpty else { return [-1, -1] }
      
       let firstIndexElement: Int = findFirstIndex(nums, target)
        
       if firstIndexElement == -1 { return [-1, -1] }
        
       let findLastIndexElement: Int = findLastIndex(nums, target)
        
       return [firstIndexElement, findLastIndexElement]
    }
    
    func findFirstIndex(_ nums: [Int], _ target: Int) -> Int {
        
        var left: Int = 0
        var right: Int = nums.count - 1
        var leftMostIndex = -1
        
        while right >= left {
            let mid = (left + right) / 2
            if target == nums[mid] {
                leftMostIndex = mid
                right = mid - 1
            } else if target > nums[mid] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
     
        return leftMostIndex
    }
    
    func findLastIndex(_ nums: [Int], _ target: Int) -> Int {
        var left: Int = 0
        var right: Int = nums.count - 1
        var rightMostIndex = -1
        
        while right >= left {
            let mid = (left + right) / 2
            if target == nums[mid] {
                rightMostIndex = mid
                left = mid + 1
            } else if target > nums[mid] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
     
        return rightMostIndex
    }
