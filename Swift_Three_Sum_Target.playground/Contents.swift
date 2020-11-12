import UIKit

// Given and array of integers find 3 digits which is equal to Sum S

func findSumElements(inputArray: [Int], target: Int) -> [Int] {
    
    guard inputArray.count > 0 else { return [] }
    
    let sortedArray = inputArray.sorted()
    
    var leftPointer: Int = 0
    var rightPointer: Int = 0
    
    for index in (0...sortedArray.count - 1) {
     
        leftPointer = index + 1
        rightPointer = sortedArray.count - 1
        
        while rightPointer > leftPointer {
            let sum = sortedArray[index] + sortedArray[leftPointer] + sortedArray[rightPointer]
            if sum == target {
                return [sortedArray[index], sortedArray[leftPointer], sortedArray[rightPointer]]
            } else if (sum < target) {
                leftPointer += 1
            } else {
                rightPointer += 1
            }
        }
    }
    
    return []
}

print(findSumElements(inputArray: [2,3,4,5,9,1], target: 15))

