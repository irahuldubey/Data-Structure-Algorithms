import UIKit

// Add 2 arrays index values
// Make sure its absolute values

extension Array where Element == Int {
    subscript (safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }
}

func arfunc(array1: [Int], array2: [Int]) -> [Int] {

    let firstArray = array1.map { return abs($0) }
    let secondArray = array2.map { return abs($0)}

    var resultantArray = [Int]()

    if firstArray.count == secondArray.count {
        for index in 0..<firstArray.count {
            let firstValue = firstArray[index]
            let secondValue = secondArray[index]
            let totalSum = firstValue + secondValue
            resultantArray.insert(totalSum, at: index)
        }
    } else {
        let maxCount = max(array1.count, array2.count)
        for index in 0..<maxCount {
            let firstValue = firstArray[safe: index] ?? 0
            let secondValue = secondArray[safe: index] ?? 0
            resultantArray.insert(firstValue + secondValue , at: index)
        }
    }

    return resultantArray
}

print(arfunc(array1: [1,3,4,5], array2: [2,3]))

