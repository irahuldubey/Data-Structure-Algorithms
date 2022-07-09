import UIKit

// hashMap
func numKLenSubstrNoRepeats1(_ s: String, _ k: Int) -> Int {
    guard !s.isEmpty else { return 0 }
    guard s.count > k else { return 0 }
    
    let arrayOfCharacters = Array(s)
    var dict = [Character: Int]()
    var start = 0
    var result = 0
    
    for (currentIndex, char) in arrayOfCharacters.enumerated() {
        if let val = dict[char], val >= start  {
            start = val + 1
        }
        dict[char] = currentIndex
        if (currentIndex - start + 1) == k {
            result = result + 1
            start = start + 1
        }
    }
    return result
}


func numKLenSubstrNoRepeats(_ s: String, _ k: Int) -> Int {
    
    guard !s.isEmpty else {
        return 0
    }
    
    let arrayOfCharacters: [Character] = Array(s)
    
    guard arrayOfCharacters.count > k else {
        return 0
    }
    
    var currentIndex = 0
    var lastIndex = k - 1
    
    var result = [String]()
    
    while currentIndex >= 0 && arrayOfCharacters.count > lastIndex {
        let arraySlice = Array(arrayOfCharacters[currentIndex...lastIndex])
        if let uniqueElement = findElementInSet(array: arraySlice) {
            result.append(uniqueElement)
        }
        currentIndex = currentIndex + 1
        lastIndex = lastIndex + 1
    }
    
    return result.count
}

func findElementInSet(array: [Character]) -> String? {
    var hashMap: [Character: Int] = [:]
    for value in array {
        if hashMap[value] != nil {
            return nil
        } else {
            hashMap[value] = 1
        }
    }
    return String(array)
}


print("BOB: \(numKLenSubstrNoRepeats("havefunonleetcode", 5))")
