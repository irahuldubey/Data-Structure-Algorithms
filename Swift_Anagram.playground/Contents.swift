import UIKit

func isAnagram(_ s: String, _ t: String) -> Bool {
    
    let arrayOfStrings1 = Array(s)
    let arrayOfStrings2 = Array(t)
    
    var hashMapDictionary: [Character: Int] = [:]
    
    for value in arrayOfStrings1 {
        if let hasValue = hashMapDictionary[value] {
            hashMapDictionary[value] = hasValue + 1
        } else {
            hashMapDictionary[value] = 1
        }
    }
    
    for value in arrayOfStrings2 {
        if let hasValue = hashMapDictionary[value] {
            hashMapDictionary[value] = hasValue - 1
        }
    }
    
    let zeroHashValues = hashMapDictionary.values.filter{ $0 != 0 }
    return zeroHashValues.count == 0
}

print(isAnagram("anagram", "nagaram"))

func isAnagram1(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    return s.sorted() == t.sorted()
}

print(isAnagram1("anagram", "nagaram"))
