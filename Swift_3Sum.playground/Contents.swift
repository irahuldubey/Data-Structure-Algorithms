import UIKit

func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 0 else { return [[]] }
    var result: [[Int]] = []
    let sortedArray = nums.sorted()
    
    for (index, value) in sortedArray.enumerated() {
        if index > 0 && value == sortedArray[index - 1] {
            continue
        } else {
            var leftPointer: Int = index + 1
            var rightPointer: Int = sortedArray.count - 1
            while rightPointer > leftPointer {
                let threeSum = value + sortedArray[leftPointer] + sortedArray[rightPointer]
                if threeSum > 0 {
                    rightPointer = rightPointer - 1
                } else if threeSum < 0 {
                    leftPointer = leftPointer + 1
                } else {
                    result.append([value,
                                   sortedArray[leftPointer],
                                   sortedArray[rightPointer]])
                    leftPointer = leftPointer + 1
                    while sortedArray[leftPointer] == sortedArray[leftPointer - 1] && rightPointer > leftPointer {
                        leftPointer = leftPointer + 1
                    }
                }
            }
        }
    }
    return result
}

print(threeSum([-1,0,1,2,-1,-4]))
