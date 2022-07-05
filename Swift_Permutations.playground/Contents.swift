import UIKit

func permute(_ nums: [Int]) -> [[Int]] {
    var result: [[Int]] = [[Int]]()
    if nums.count == 1 {
        return [nums]
    }
    var nums = nums
    var index = 0
    
    while index < nums.count {
        let firstVal = nums[0]
        let remainder = nums.remove(at: 0)
        let permuted = permute(nums)
        var permResult = [[Int]]()
        for var pVal in permuted {
            pVal.append(remainder)
            permResult.append(pVal)
        }
        result.append(contentsOf: permResult)
        nums.append(firstVal)
        index = index + 1
    }
    return result
}

permute([1,2,3])
