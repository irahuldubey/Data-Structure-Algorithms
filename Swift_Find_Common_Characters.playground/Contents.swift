import UIKit

// 1002. Find Common Characters

//time complexity - O(n*l)
//space complexity - O(1)
func commonChar(_ A: [String]) -> [String] {
    var previousDictionary: [String: Int] = [String: Int]()
    var currentDictionary: [String: Int] = [String: Int]()
    
    guard let firstWord = A.first else { return [] }
    
    for value in firstWord {
        let stringValue = String(value)
        if let prevValue = previousDictionary[stringValue] {
            previousDictionary[stringValue] = prevValue + 1
        } else {
            previousDictionary[stringValue] = 1
        }
    }
    
    for stringValue in A[1...] {
        for char in stringValue {
            let stringCharValue = String(char)
            if let previousDictionaryValue = previousDictionary[stringCharValue] {
                if let currentDictionaryValue = currentDictionary[stringCharValue] {
                    currentDictionary[stringCharValue] = previousDictionaryValue > currentDictionaryValue ? currentDictionaryValue  + 1 : previousDictionaryValue
                } else {
                    currentDictionary[stringCharValue] = 1
                }
            }
        }
        previousDictionary = currentDictionary
        currentDictionary.removeAll()
    }
    
    var results: [String] = []
    for (key, value) in previousDictionary {
        for _ in 0..<value {
            results.append(key)
        }
    }
    return results
}

print(commonChar(["cooool","lock","cook"]))
