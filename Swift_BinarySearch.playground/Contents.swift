import UIKit

//// Iterative method
func search(_ nums: [Int], _ target: Int) -> Int {

    var lowerBound = 0
    var upperBound = nums.count

    while upperBound > lowerBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        print("midIndex", midIndex)
        if nums[midIndex] == target {
          return midIndex
        } else if nums[midIndex] < target {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    return -1
}

print(search([0, 1, 21, 33, 45, 45, 61, 71, 72, 73], 33))

func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        // If we get here, then the search key is not present in the array.
        return nil

    } else {
        print("range", range)

        // Calculate where to split the array.
        let myLowerBound = range.lowerBound
        let myUpperBound = (range.upperBound - range.lowerBound) / 2
        
        print(myLowerBound, myUpperBound)
        
        let midIndex = myLowerBound + myUpperBound
        
        print("mid Index", midIndex)

        // Is the search key in the left half?
        if a[midIndex] > key {
            return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)

        // Is the search key in the right half?
        } else if a[midIndex] < key {
            return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)

        // If we get here, then we've found the search key!
        } else {
            return midIndex
        }
    }
}

let numbers = [2, 3, 5, 7, 11, 13, 17]
print(binarySearch(numbers, key: 11, range: 0 ..< numbers.count))    // gives 13


