import Foundation

public func mergeSortRecursion(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSortRecursion(Array(array[0..<middleIndex]))
    let rightArray = mergeSortRecursion(Array(array[middleIndex..<array.count]))
    
    // here
    return merge(leftArray, rightArray)
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [Int] = []
    
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



public func mergeSortRecursionInPlace(_ array: inout [Int], start: Int, end: Int) {
    
    guard array.count > 1 else { return }
    
    let mid = (start + end) / 2
    
    mergeSortRecursionInPlace(&array, start: start, end: mid)
    
    mergeSortRecursionInPlace(&array, start: mid, end: end)
    
    mergeInPlace(&array, start, mid, end)
}

func mergeInPlace(_ array: inout [Int], _ start: Int, _ mid: Int, _ end: Int) {
    var leftIndex = start
    var rightIndex = mid
    
    var orderedArray: [Int] = []
    
    while leftIndex < mid && rightIndex < end {
        // 1
        let leftElement = array[leftIndex]
        let rightElement = array[rightIndex]
        
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
    while leftIndex < array.count {
        orderedArray.append(array[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < array.count {
        orderedArray.append(array[rightIndex])
        rightIndex += 1
    }
    
    for val in 0..<orderedArray.count {
        array[start+val] = orderedArray[val]
    }
    
}
