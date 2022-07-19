import Foundation

public func quickSort(_ nums: inout [Int], low: Int, high: Int) {
    
    if low > high { return }
    
    var start = low
    var end = high
    let mid = (start + end) / 2
    
    let pivot = nums[mid]
    
    while start <= end {
        while nums[start] < pivot {
            start = start + 1
        }
        
        while nums[end] > pivot {
            end = end - 1
        }
        
        if start <= end {
            let temp = nums[start]
            nums[start] = nums[end]
            nums[end] = temp
            start = start + 1
            end = end - 1
        }
    }
    
    quickSort(&nums, low: low, high: end)
    quickSort(&nums, low: start, high: high)
}

