import UIKit

func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    
    var i = 1, j = 1
    while j < nums.endIndex {
        if nums[j] != nums[i - 1] {
            nums[i] = nums[j]
            i += 1
            j += 1
        } else {
            j += 1
        }
    }
    return i
}

var inpurArray = [0,0,1,1,1,2,2,3,3,4,5]
print(removeDuplicates(&inpurArray))

func removeDuplicates1(_ nums: inout [Int]) -> Int {
    return Set(nums).count
}

var inpurArray1 = [0,0,1,1,1,2,2,3,3,4,5]
print(removeDuplicates(&inpurArray1))

