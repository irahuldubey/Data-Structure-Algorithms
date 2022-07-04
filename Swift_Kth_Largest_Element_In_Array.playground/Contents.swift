import UIKit

class Solution {
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        var start = 0
        var end = nums.count - 1
        
        let index = nums.count - k
        while(start <= end){
            let position = partition(&nums, start, end)
         
            if(position == index){
                return nums[position]
            }else if(position < index){
                start = position + 1
            }else{
                end = position - 1
            }
        }
        return -1
    }
    
    func partition(_ nums: inout [Int], _ start: Int, _ end:  Int) -> Int {
        let index = start
        let pivot = nums[start]
        var start = start
        var end = end
        
        while(start <= end){
            while(start <= end && nums[start] <= pivot){
                start += 1
            }
            while(start <= end && nums[end] >= pivot){
                end -= 1
            }
            if(start <= end){
                swap(&nums, start, end)
                start += 1
                end -= 1
            }
        }
        swap(&nums, index, end)
        return end
    }
    
    func swap(_ nums: inout [Int], _ start: Int, _ end: Int){
        let temp = nums[start]
        nums[start]  = nums[end]
        nums[end] = temp
    }
}


class Solution1 {
    
    var nums: [Int] = [Int]()
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        self.nums = nums
        let size = nums.count
        return quickSelect(left: 0, right: size - 1, k: size - k)
    }
    
    func swapValues(index1: Int, index2: Int) {
        let tempValue = nums[index1]
        nums[index1] = nums[index2]
        nums[index2] = tempValue
    }
    
    func partionValue(left: Int, right: Int, pivotIndex: Int) -> Int {
        let pivot = nums[pivotIndex]
        swapValues(index1: pivotIndex, index2: right)
                
        var i: Int = left
        for j in left..<right {
            if pivot > nums[j] {
                swapValues(index1: i, index2: j)
                i += 1
            }
        }
        swapValues(index1: i, index2: right)
        return i
    }
    
    func quickSelect(left: Int, right: Int, k: Int) -> Int {
        if left == right { return nums[left] }
        
        let index = left + (right - left) / 2
        let pivot = partionValue(left: left, right: right, pivotIndex:  index)
        
        let pIndex = partionValue(left: left, right: right, pivotIndex: pivot)
        
        if pIndex == k {
            return nums[pIndex]
        } else if pIndex > k {
            return quickSelect(left: left, right: pIndex - 1, k: k)
        } else {
            return quickSelect(left: pIndex + 1, right: right, k: k)
        }
    }
}

let sol = Solution1()
let value = sol.findKthLargest([7,6,5,4,3,2,1], 2)
debugPrint("BOB:: \(value)")

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [Int] = []
    
    // 1
    while leftIndex < left.count && rightIndex < right.count {
        // 1
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement { // 2
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement { // 3
            orderedArray.append(rightElement)
            rightIndex += 1
        } else { // 4
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    // 2
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}

merge([2, 3, 4, 5, 9]
, [10,12,5, 1])
