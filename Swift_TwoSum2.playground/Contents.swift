import UIKit

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {

    guard numbers.count > 0 else { return [] }
    
    var leftPointer: Int = 0
    var rightPointer: Int = numbers.count - 1
    
    while rightPointer > leftPointer {
        let leftValue = numbers[leftPointer]
        let rightValue = numbers[rightPointer]
        
        let calculatedValue = leftValue + rightValue
        
        if calculatedValue > target {
           rightPointer = rightPointer - 1
        } else if calculatedValue < target {
            leftPointer = leftPointer + 1
        } else {
            return [leftPointer + 1, rightPointer + 1]
        }
    }
    
    return []
}

print(twoSum([2,3,4], 6))
