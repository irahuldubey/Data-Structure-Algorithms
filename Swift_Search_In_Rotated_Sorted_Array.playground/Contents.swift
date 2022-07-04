import UIKit

func search(_ nums: [Int], _ target: Int) -> Int {
       
       guard nums.count > 0 else { return 0 }
       
       var mid: Int = 0
       var left: Int = 0
       var right: Int = nums.count - 1
       
       while right >= left {
        
           mid = (left + right) / 2
           
           if nums[mid] == target {
               return mid
           } else if nums[mid] >= nums[left] {
               // Search in left half
               if target <= nums[mid] && target >= nums[left] {
                   right = mid - 1
               } else {
                   left = mid + 1
               }
           } else {
               // Search in right half
               if target >= nums[mid] && target <= nums[right]  {
                   left = mid + 1
               } else {
                   right = mid - 1
               }
           }
       }
       
       return -1
   }
