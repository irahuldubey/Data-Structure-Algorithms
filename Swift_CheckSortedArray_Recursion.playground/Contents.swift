import UIKit

func checkIsArrayIsSorted(array: [Int]) -> Bool {
    
    guard !array.isEmpty else { return true }
    
    return isSorted(arr: array, index: 0)
}

func isSorted(arr: [Int], index: Int) -> Bool {
    
    // Base condition
    if index == arr.count - 1 {
        return true
    }
    
    return arr[index] < arr[index + 1] && isSorted(arr: arr, index: index + 1)
}


print(validateElement(in: [1,2,3,4,5,6], target: 5))


// Linear search with recursion

func validateElement(in array: [Int], target: Int) -> Bool {
    return elementIn(array: array, target: target, index: 0)
}

func elementIn(array: [Int], target: Int, index: Int) -> Bool {
    
    if array.count == index {
        return false
    }
    
    if array[index] == target {
        return true
    }
    
    return elementIn(array: array, target: target, index: index + 1)
}
