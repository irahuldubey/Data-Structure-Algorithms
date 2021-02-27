import UIKit

func frequencySort(_ nums: [Int]) -> [Int] {
    
    guard nums.count > 0 else {
        return []
    }

    var sortDictionary: [Int: Int] = [Int: Int]()
    
    for value in nums {
        if let sortDictValue = sortDictionary[value] {
            sortDictionary[value] = sortDictValue + 1
        } else {
            sortDictionary[value] = 1
        }
    }
    
    let sortedKeys = sortDictionary.keys.sorted { (number1, number2) -> Bool in
        if sortDictionary[number1]! == sortDictionary[number2]! {
            return number1 > number2
        } else {
            return sortDictionary[number1]! < sortDictionary[number2]!
        }
    }

    var sortArray: [Int] = []
    for element in sortedKeys {
        for _ in 0..<sortDictionary[element]! {
            sortArray.append(element)
        }
    }
    return sortArray
}


let nums = [2,3,1,3,2]

//Input [2,3,1,3,2]
//Output [1,2,2,3,3]
//Expected [1,3,3,2,2]

print(frequencySort(nums))
