import UIKit

func canPermutePalindrome(_ s: String) -> Bool {
    
    guard !s.isEmpty else { return true }
    
    let remainder = s.count % 2
    
    let isOddString = remainder == 1
    let isEvenString = remainder == 0
    
    var hashMap: [Character: Int] = [:]
    
    let arrayOfCharacters: [Character] = Array(s)
    
    for val in arrayOfCharacters {
        if let hashVal = hashMap[val] {
            hashMap[val] = hashVal + 1
        } else {
            hashMap[val] = 1
        }
    }
    
    print(hashMap)
    
    var count = 0
    
    for (key, val) in hashMap {
        if val % 2 == 1 {
            count = count + 1
        }
    }
    
    return count < 2
}

print(canPermutePalindrome("aaa"))
