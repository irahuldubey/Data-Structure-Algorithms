import UIKit

func findSlidingWindow(from array: [String]) -> [[String]] {
    guard !array.isEmpty else { return [[]] }
    guard array.count >= 4 else { return [[]] }
    var resultArray = [[String]]()
    var currentIndex = 0
    var lastIndex = 3
    while currentIndex >= 0 && array.count > lastIndex {
        let arraySlice = Array(array[currentIndex...lastIndex])
        let element = findElement(in: arraySlice)
        if element.count > 0 {
            resultArray.append(element)
            currentIndex = lastIndex
            lastIndex = lastIndex + 3
        } else {
            currentIndex += 1
            lastIndex += 1
        }
    }
    return resultArray
}

func findElement(in array: [String]) -> [String] {
    var hashMap: [String: Int] = [:]
    for value in array {
        if let hashVal = hashMap[value] {
            hashMap[value] = hashVal + 1
        } else {
            hashMap[value] = 1
        }
    }
    let all3Elements = hashMap.filter { $0.value >= 3 && $0.value <= 4 }
    var allKey: [String] = [String]()
    all3Elements.forEach { allKey.append($0.key) }
    return allKey
}

let name = ["A", "A", "A", "A"]
let name1 = ["A", "A", "A", "A", "A", "A", "A", "A"]
let name2 = ["A", "A", "B", "B", "A", "A"]
let name3 = ["A", "A", "A", "B", "C", "B", "B", "A", "B"]
print(findSlidingWindow(from: name3))
